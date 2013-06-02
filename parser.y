%{
#include <stdio.h>
#include <stdlib.h>
#include "arbol.h"
#include "CrearArbol.h"
#define BLUE "\e[34m"
#define RED "\e[31m"
#define GREEN "\e[32m"
#define YELLOW "\e[33m"
#define WHITE "\e[m"
#define CYAN "\e[36m"
#define MAGENTA "\e[35m"







//Metodo que crea nuevos elementos del arbol sintactico
//Recibe el valor del nodo, y el padre del nodo.

void yyerror(char *s);
%} 

%union {
             
             char* str;
         }
%token T_dl T_html T_script T_dt T_img T_span
	T_a T_dd T_input T_strong T_b T_em T_li
	T_style T_blockquote T_embed T_link T_table
	T_body T_footer T_meta T_td T_br T_form 
	T_object T_th T_button T_h1 T_h2 T_h3
	T_h4 T_h5 T_h6 T_ol T_tr T_caption T_head
	T_option T_textarea T_code T_header T_p T_title
	T_div T_hr T_pre T_ul T_Atributtes T_Values T_Text 
	T_XML T_PublicIdentifier T_DOCTYPE

%%


xhtml : doctype html_tag
{
	preImprimirArbol(arbol);
	}
;
doctype : '<''!'dctype html pblid values values'>'
{
	docTypeCreado=1;// Me indica que el docktype ya fue creado
	docTypeDocumento= crearDocType(listaTextosDocType->primerTexto->texto,listaTextosDocType->primerTexto->siguiente->texto);
	arbol->doctype=docTypeDocumento;
	listaTextosDocType= crearListaTextos();
}
;
html_tag : html_h head_h body html_t 
;
html_h : '<'html atributos '>' {
	nodoActual= crearNodo("html",raizDocumento); 
	ListaAtributos_t* listaTmp =listaAtributosActual;
	agregarListaAtributos(nodoActual,listaTmp);
	listaAtributosActual=crearListaAtributos();
}//Agregado a la gramatica
;
html_t : '<' '/' html '>' //Agregado a la gramtica 
;
head_h : head_h2 head_tag 
;
head_h2 : '<' head atributos '>' //Agregado a la gramatica
{
	nodoActual= crearNodo("head",nodoActual); 
	ListaAtributos_t* listaTmp =listaAtributosActual;
	agregarListaAtributos(nodoActual,listaTmp);
	listaAtributosActual=crearListaAtributos();
}//Agregado a la gramatica
;
head_tag :  infoh head_t 
;
head_t : '<' '/' head '>' {
	nodoActual= nodoActual->padre;
}
;
infoh : meta title_h
| title_h
;
meta : '<' T_meta atributos '/' '>' 
{
	nodoActual= crearNodo("meta",nodoActual); 
	ListaAtributos_t* listaTmp =listaAtributosActual;
	agregarListaAtributos(nodoActual,listaTmp);
	listaAtributosActual=crearListaAtributos();
	nodoActual= nodoActual->padre;
}//Agregado a la gramatica
;
body : body_h body_tag
;
body_h: '<' T_body atributos '>' {
	nodoActual= crearNodo("body",nodoActual); 
	ListaAtributos_t* listaTmp =listaAtributosActual;
	agregarListaAtributos(nodoActual,listaTmp);
	listaAtributosActual=crearListaAtributos();
}//Agregado a la gramatica
;
body_tag :  tags body_tag
| body_t
;
body_t : '<' '/' T_body '>' 
{
	nodoActual= nodoActual->padre;
}
;
tags : a_h 
| dt_h 
| img_h 
| span_h 
| dl_h
| dd_h
| input_h
| strong_h
| b_h
| em_h
| li_h
| style_h
| blockquote_h
| embed_h
| link_h
| table_h
| footer_h
| td_h
| br_h
| form_h
| object_h
| th_h
| button_h
| h1_h
| h2_h
| h3_h
| h4_h
| h5_h
| h6_h
| ol_h
| tr_h
| caption_h
| option_h
| textarea
| code_h
| header_h
| p_h 
| title_h
| div_h
| hr_h
| pre_h
| ul_h
;
a_h : a_h2 a_tag //Modificacion gramtica
;
a_h2 : '<' T_a atributos '>'//Agregado a la gramtica
{
	accionCabezaLeida_Arbl("a");
}
;
em_h : em_h2 em_tag
;
em_h2 : '<' T_em atributos '>'//Agregado a la gramtica
{
	accionCabezaLeida_Arbl("em");
}
;
dt_h : dt_h2 dt_tag
;
dt_h2 : '<' T_dt atributos '>'//Agregado a la gramtica
{
	accionCabezaLeida_Arbl("dt");
}
;
img_h : '<' T_img atributos '/''>'{
	nodoActual= crearNodo("img",nodoActual); 
	ListaAtributos_t* listaTmp =listaAtributosActual;
	agregarListaAtributos(nodoActual,listaTmp);
	listaAtributosActual=crearListaAtributos();
	nodoActual= nodoActual->padre;
}//Modificado borre img_tag !!!!!!!!!!!!!!!!!!!!!!!!!PREGUNTAR SI ES IMPORTANTE!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
;
span_h : span_h2 span_tag
;
span_h2 : '<' T_span atributos '>'//Agregado a la gramtica
{
	accionCabezaLeida_Arbl("span");
}
;
dl_h : dl_h2 dl_tag
;
dl_h2 : '<' T_dl atributos '>'//Agregado a la gramtica
{
	accionCabezaLeida_Arbl("dl");
}
;
dd_h : dd_h2 dd_tag
;
dd_h2 : '<' T_dd atributos '>'//Agregado a la gramtica
{
	accionCabezaLeida_Arbl("dd");
}
;
b_h : b_h2 b_tag
;
b_h2 : '<' T_b atributos '>'//Agregado a la gramtica
{
	accionCabezaLeida_Arbl("b");
}
;
li_h : li_h2 li_tag
;
li_h2 : '<' T_li atributos '>'//Agregado a la gramtica
{
	accionCabezaLeida_Arbl("li");
}
;
strong_h: strong_h2 strong_tag
;
strong_h2 : '<' T_strong atributos '>'//Agregado a la gramtica
{
	accionCabezaLeida_Arbl("strong");
}
;
style_h : style_h2 style_tag
;
style_h2 : '<' T_style atributos '>'//Agregado a la gramtica
{
	accionCabezaLeida_Arbl("style");
}
;
blockquote_h : blockquote_h2 blockquote_tag
;
blockquote_h2 : '<' T_blockquote atributos '>'//Agregado a la gramtica
{
	accionCabezaLeida_Arbl("blockquote");
}
;
embed_h : embed_h2 embed_tag
;
embed_h2 : '<' T_embed atributos '>'//Agregado a la gramtica
{
	accionCabezaLeida_Arbl("embed");
}
;
link_h : link_h2 link_tag
;
link_h2 : '<' T_link atributos '>'
{
	accionCabezaLeida_Arbl("link");
}
;
table_h : table_h2 table_tag
;
table_h2 : '<' T_table atributos '>'
{
	accionCabezaLeida_Arbl("table");
}
;
footer_h : footer_h2 footer_tag
;
footer_h2 : '<' T_footer atributos '>'
{
	accionCabezaLeida_Arbl("footer");
}
;
td_h : td_h2 td_tag
;
td_h2 : '<' T_td atributos '>'
{
	accionCabezaLeida_Arbl("td");
}
;
br_h : br_h2 br_tag
;
br_h2 : '<' T_br atributos '>'
{
	accionCabezaLeida_Arbl("br");
}
;
form_h : form_h2 form_tag
;
form_h2 : '<' T_form atributos '>'
{
	accionCabezaLeida_Arbl("form");
}
;
object_h : object_h2 object_tag//Modificacion gramtica
;
object_h2: '<' T_object atributos '>'
{
	accionCabezaLeida_Arbl("object");
}
;
th_h : th_h2 th_tag
;
th_h2 : '<' T_th atributos '>'
{
	accionCabezaLeida_Arbl("th");
}
;
button_h : button_h2 button_tag
;
button_h2 : '<' T_button atributos '>'
{
	accionCabezaLeida_Arbl("button");
}
;
h1_h : h1_h2 h1_tag
;
h1_h2 : '<' T_h1 atributos '>'
{
	accionCabezaLeida_Arbl("h1");
}
;
h2_h : h2_h2 h2_tag
;
h2_h2 : '<' T_h2 atributos '>'
{
	accionCabezaLeida_Arbl("h2");
}
;
h3_h : h3_h2 h3_tag
;
h3_h2 : '<' T_h3 atributos '>'
{
	accionCabezaLeida_Arbl("h3");
}
;
h4_h : h4_h2 h4_tag
;
h4_h2 : '<' T_h4 atributos '>'
{
	accionCabezaLeida_Arbl("h4");
}
;
h5_h : h5_h2 h5_tag
;
h5_h2 : '<' T_h5 atributos '>'
{
	accionCabezaLeida_Arbl("h5");
}
;
h6_h : h6_h2 h6_tag
;
h6_h2 : '<' T_h6 atributos '>'
{
	accionCabezaLeida_Arbl("h6");
}
;
ol_h : ol_h2 ol_tag
;
ol_h2 : '<' T_ol atributos '>'
{
	accionCabezaLeida_Arbl("ol");
}
;
tr_h : tr_h2 tr_tag
;
tr_h2 : '<' T_tr atributos '>'
{
	accionCabezaLeida_Arbl("tr");
}
;
caption_h : caption_h2 caption_tag
;
caption_h2 : '<' T_caption atributos '>'
{
	accionCabezaLeida_Arbl("caption");
}
;
option_h : option_h2 option_tag
;
option_h2: '<' T_option atributos '>'
{
	accionCabezaLeida_Arbl("option");
}
;
textarea : textarea_h2 textarea_tag
;
textarea_h2: '<' T_textarea atributos '>'
{
	accionCabezaLeida_Arbl("textarea");
}
;
code_h : code_h2 code_tag
; 
code_h2: '<' T_code atributos '>'
{
	accionCabezaLeida_Arbl("code");
}
;
header_h : header_h2 header_tag
;
header_h2: '<' T_header atributos '>'
{
	accionCabezaLeida_Arbl("header");
}
;
p_h : p_h2 p_tag//Modificacion gramtica
;
p_h2: '<' T_p atributos '>' 
{
	accionCabezaLeida_Arbl("p");
}
//Agregado a la gramatica
;
title_h: title_h2 title_tag
;
title_h2: '<' T_title atributos '>' 
{
	//Si hay algun texto en la lista pertenecen al padre de title
	accionCabezaLeida_Arbl("title");
}
div_h : div_h2 div_tag
;
div_h2: '<' T_div atributos '>'
{
	accionCabezaLeida_Arbl("div");
}
;
hr_h : hr_h2 hr_tag
;
hr_h2: '<' T_hr atributos '>'
{
	accionCabezaLeida_Arbl("hr");
}
;
pre_h : pre_h2 pre_tag
;
pre_h2: '<' T_pre atributos '>'
{
	accionCabezaLeida_Arbl("pre");
}
;
ul_h : ul_h2 ul_tag
;
ul_h2: '<' T_ul atributos '>'
{
	accionCabezaLeida_Arbl("ul");
}
;
input_h : input_h2 input_tag 
;
input_h2: '<' T_input atributos '>'
{
	accionCabezaLeida_Arbl("input");
}
;
a_tag : info tags a_t 
| info a_t 
| a_t 
;
a_t : a_t2 infos 
;
a_t2 :  '<' '/' T_a '>' 
{
	accionColaLeida_Arbl();
}
;
em_tag : info tags em_t
| info em_t
| em_t
;
em_t : em_t2 infos
;
em_t2 :  '<' '/' T_em '>' 
{
	accionColaLeida_Arbl();
}
;
dt_tag : info tags dt_t
| info dt_t
| dt_t
;
dt_t : dt_t2 infos
;
dt_t2 :  '<' '/' T_dt '>' 
{
	accionColaLeida_Arbl();
}
;
span_tag : info tags span_t
| info span_t
| span_t
;
span_t : span_t2 infos
;
span_t2 :  '<' '/' T_span '>' 
{
	accionColaLeida_Arbl();
}
;
dl_tag : info tags dl_t
| info dl_t
| dl_t
;
dl_t : dl_t2 infos
;
dl_t2 :  '<' '/' T_dl '>' 
{
	accionColaLeida_Arbl();
}
;
dd_tag : info tags dd_t
| info dd_t
| dd_t
;
dd_t : dd_t2 infos
;
dd_t2 :  '<' '/' T_dd '>' 
{
	accionColaLeida_Arbl();
}
;
b_tag : info tags b_t
| info b_t
| b_t
;
b_t : b_t2 infos
;
b_t2 :  '<' '/' T_b '>' 
{
	accionColaLeida_Arbl();
}
;
li_tag : info tags li_t
| info li_t
| li_t
;
li_t : li_t2 infos
;
li_t2 :  '<' '/' T_li '>' 
{
	accionColaLeida_Arbl();
}
;
strong_tag : info tags strong_t
| info strong_t
| strong_t
;
strong_t : strong_t2 infos
;
strong_t2 :  '<' '/' T_strong '>' 
{
	accionColaLeida_Arbl();
}
;
style_tag : info tags style_t
| info style_t
| style_t
;
style_t : style_t2 infos
;
style_t2 :  '<' '/' T_style '>' 
{
	accionColaLeida_Arbl();
}
;
blockquote_tag : info tags blockquote_t
| info blockquote_t
| blockquote_t
;
blockquote_t : blockquote_t2 infos
;
blockquote_t2 :  '<' '/' T_blockquote '>' 
{
	accionColaLeida_Arbl();
}
;
embed_tag : info tags embed_t
| info embed_t
| embed_t
;
embed_t : embed_t2 infos
;
embed_t2 :  '<' '/' T_embed '>' 
{
	accionColaLeida_Arbl();
}
;
link_tag : info tags link_t
| info link_t
| link_t
;
link_t : link_t2 infos
;
link_t2 :  '<' '/' T_link '>' 
{
	accionColaLeida_Arbl();
}
;
table_tag : info tags table_t
| info table_t
| table_t
;
table_t : table_t2 infos
;
table_t2 :  '<' '/' T_table '>' 
{
	accionColaLeida_Arbl();
}
;
footer_tag : info tags footer_t
| info footer_t
| footer_t
;
footer_t : footer_t2 infos
;
footer_t2 :  '<' '/' T_footer '>' 
{
	accionColaLeida_Arbl();
}
;
td_tag : info tags td_t
| info td_t
| td_t
;
td_t : td_t2 infos
;
td_t2 :  '<' '/' T_td '>' 
{
	accionColaLeida_Arbl();
}
;
br_tag : info tags br_t
| info br_t
| br_t
;
br_t : br_t2 infos
;
br_t2 :  '<' '/' T_br '>' 
{
	accionColaLeida_Arbl();
}
;
form_tag : info tags form_t
| info form_t
| form_t
;
form_t : form_t2 infos
;
form_t2 :  '<' '/' T_form '>' 
{
	accionColaLeida_Arbl();
}
;
object_tag : info tags object_t
| info object_t
| object_t
;
object_t : object_t2 infos//Modificacion gramatica
;
object_t2: '<' '/' T_object '>'
{
	accionColaLeida_Arbl();
}
//Agregado a la gramatica
;
th_tag : info tags th_t
| info th_t
| th_t
;
th_t : th_t2 infos
;
th_t2 :  '<' '/' T_th '>' 
{
	accionColaLeida_Arbl();
}
;
button_tag : info tags button_t
| info button_t
| button_t
;
button_t : button_t2 infos
;
button_t2 :  '<' '/' T_button '>' 
{
	accionColaLeida_Arbl();
}
;
h1_tag : info tags h1_t
| info h1_t
| h1_t
;
h1_t : h1_t2 infos
;
h1_t2 :  '<' '/' T_h1 '>'
{
	accionColaLeida_Arbl();
} 
;
h2_tag : info tags h2_t
| info h2_t
| h2_t
;
h2_t : h2_t2 infos
;
h2_t2 :  '<' '/' T_h2 '>' 
{
	accionColaLeida_Arbl();
}
;
h3_tag : info tags h3_t
| info h3_t
| h3_t
;
h3_t : h3_t2 infos
;
h3_t2 :  '<' '/' T_h3 '>' 
{
	accionColaLeida_Arbl();
}
;
h4_tag : info tags h4_t
| info h4_t
| h4_t
;
h4_t : h4_t2 infos
;
h4_t2 :  '<' '/' T_h4 '>' 
{
	accionColaLeida_Arbl();
}
;
h5_tag : info tags h5_t
| info h5_t
| h5_t
;
h5_t : h5_t2 infos
;
h5_t2 :  '<' '/' T_h5 '>' 
{
	accionColaLeida_Arbl();
}
;
h6_tag : info tags h6_t
| info h6_t
| h6_t
;
h6_t : h6_t2 infos
;
h6_t2 :  '<' '/' T_h6 '>' 
{
	accionColaLeida_Arbl();
}
;
ol_tag : info tags ol_t
| info ol_t
| ol_t
;
ol_t : ol_t2 infos
;
ol_t2 :  '<' '/' T_ol '>' 
{
	accionColaLeida_Arbl();
}
;
tr_tag : info tags tr_t
| info tr_t
| tr_t
;
tr_t : tr_t2 infos
;
tr_t2 :  '<' '/' T_tr '>' 
{
	accionColaLeida_Arbl();
}
;
caption_tag : info tags caption_t
| info caption_t
| caption_t
;
caption_t : caption_t2 infos
;
caption_t2 :  '<' '/' T_caption '>' 
{
	accionColaLeida_Arbl();
}
;
option_tag : info tags option_t
| info option_t
| option_t
;
option_t : option_t2 infos
;
option_t2 :  '<' '/' T_option '>' 
{
	accionColaLeida_Arbl();
}
;
textarea_tag : info tags textarea_t
| info textarea_t
| textarea_t
;
textarea_t : textarea_t2 infos
;
textarea_t2 :  '<' '/' T_textarea '>' 
{
	accionColaLeida_Arbl();
}
;
code_tag : info tags code_t
| info code_t
| code_t
;
code_t : code_t2 infos
; 
code_t2 :  '<' '/' T_code '>' 
{
	accionColaLeida_Arbl();
}
;
header_tag : info tags header_t
| info header_t
| header_t
;
header_t : header_t2 infos
;
header_t2 :  '<' '/' T_header '>' 
{
	accionColaLeida_Arbl();
}
;
p_tag : info tags p_t
| info p_t
| p_t
;
p_t : p_t2 infos //Modificacion a la gramatica
; 
p_t2 :  '<' '/' T_p '>' 
{
	accionColaLeida_Arbl();
}
//Agregado a la gramatica
;
title_tag : info title_t
| title_t
;
title_t : '<' '/' T_title '>' //PORQUE TITLE NO TIENE INFOS
{
	accionColaLeida_Arbl();
}
;
div_tag : info tags div_t
| info div_t
| div_t
;
div_t : div_t2 infos
;
div_t2 :  '<' '/' T_div '>' 
{
	accionColaLeida_Arbl();
}
;
hr_tag : info tags hr_t
| info hr_t
| hr_t
;
hr_t : hr_t2 infos
;
hr_t2 :  '<' '/' T_hr '>' 
{
	accionColaLeida_Arbl();
}
;
pre_tag : info tags pre_t
| info pre_t
| pre_t
;
pre_t : pre_t2 infos
;
pre_t2 :  '<' '/' T_pre '>' 
{
	accionColaLeida_Arbl();
}
;
ul_tag : info tags ul_t
| info ul_t
| ul_t
;
ul_t : ul_t2 infos
;
ul_t2 :  '<' '/' T_ul '>' 
{
	accionColaLeida_Arbl();
}
;
input_tag : info tags input_t
| info input_t
| input_t
;
input_t : input_t2 infos
;
input_t2 :  '<' '/' T_input '>' 
{
	accionColaLeida_Arbl();
}
;
atributos : atributo atributos
|
;
atributo : atributte'='values { //Agregado a la gramatica
	Atributo_t* nuevoAtributo = crearAtributo(nombreAtributoLeido, valorAtributoLeido);
	agregarAtributo(listaAtributosActual,nuevoAtributo);
}
	
;
text :T_Text{
	Texto_t* nuevoTexto = crearTexto(yylval.str);
	agregarTexto(listaTextosActual,nuevoTexto);
}
;
html : T_html;
dctype : T_DOCTYPE
;
pblid : T_PublicIdentifier
;
values : T_Values {
	 if(docTypeCreado==0){
		Texto_t* nuevoTexto = crearTexto(yylval.str);
		agregarTexto(listaTextosDocType,nuevoTexto);
	 }
	 else{
		valorAtributoLeido= yylval.str;
	} //Modificacion gramatica
}
;
head : T_head
;
atributte : T_Atributtes  {nombreAtributoLeido= yylval.str;}//Modificacion gramatica
;
infos: 
| text infos
;
info : text infos 
| tags
;

%%

int main() {
	docTypeCreado=0;
	raizDocumento= crearNodo("arbol",NULL);
	listaAtributosActual= crearListaAtributos();
	listaTextosActual= crearListaTextos();
	listaTextosDocType = crearListaTextos();
	arbol = malloc(sizeof(Arbol_t));
	arbol->raizHtml= raizDocumento;
	return yyparse();
}

void yyerror(char *s)
{
	printf("%s","FAAAAAAAAAAAAAAAAAIL");
}

void agregarHijo(Nodo_t* padre, Nodo_t* hijo){
	if(padre->listaHijos->primerHijo==NULL)
		padre->listaHijos->primerHijo=hijo;
	else{
		Nodo_t* nodoTmp= padre->listaHijos->primerHijo;
		while(nodoTmp->siguiente!=NULL){
			nodoTmp=nodoTmp->siguiente;
		}
		nodoTmp->siguiente=hijo;
	}
}
//Metodo que crea nuevos elementos del arbol sintactico
//Recibe el valor del nodo, y el padre del nodo.
Nodo_t* crearNodo(char* nombreNodo,Nodo_t* padre){
	Nodo_t* nuevoNodo = malloc(sizeof(Nodo_t));
	nuevoNodo->listaAtributos= malloc(sizeof(ListaAtributos_t));
	nuevoNodo->listaTextos= malloc(sizeof(ListaTextos_t));
	nuevoNodo->nombreNodo=nombreNodo;
	nuevoNodo->padre=padre;
	nuevoNodo->siguiente=NULL;//Al no tener hermanos en este momento nodo siguiente se inicia en NULL
	nuevoNodo->listaHijos=malloc(sizeof(struct ListaHijos));
	if(padre!=NULL){
		agregarHijo(padre,nuevoNodo);
	}
	return nuevoNodo;
}

//Metodo que agrega un hijo a un nodo padre
//Recibe un nodo_t padre y un nodo_t hijo


Atributo_t* crearAtributo(char* nombreAtributo, char* valorAtributo){
	Atributo_t* nuevoAtributo = malloc(sizeof(Atributo_t));
	
	nuevoAtributo->nombreAtributo=nombreAtributo;
	nuevoAtributo->valorAtributo=valorAtributo;
	nuevoAtributo->siguiente=NULL;//Al no tener hermanos en este momento nodo siguiente se inicia en NULL
	return nuevoAtributo;
}
//Se agrega elatributo a una lista de atributos
void agregarAtributo(ListaAtributos_t* listaAtributos, Atributo_t* atributo){
	if(listaAtributos->primerAtributo==NULL)
		listaAtributos->primerAtributo=atributo;
	else{
		Atributo_t* atributoTmp= listaAtributos->primerAtributo;
		while(atributoTmp->siguiente!=NULL){
			atributoTmp=atributoTmp->siguiente;
		}
		atributoTmp->siguiente=atributo;
	}
}

void agregarListaAtributos(Nodo_t* nodo, ListaAtributos_t* listaAtributos){
	nodo->listaAtributos= listaAtributos;
}
ListaAtributos_t* crearListaAtributos(){
	ListaAtributos_t* listaAtributos = malloc(sizeof(ListaAtributos_t));
	return listaAtributos;
}

Texto_t* crearTexto(char* valorTexto){
	Texto_t* nuevoTexto = malloc(sizeof(Texto_t));
	
	nuevoTexto->texto= valorTexto;
	nuevoTexto->siguiente=NULL;//Al no tener hermanos en este momento nodo siguiente se inicia en NULL
	return nuevoTexto;
}
//Se agrega el texto a la lista de textos
void agregarTexto(ListaTextos_t* listaTextos, Texto_t* texto){
	if(listaTextos->primerTexto==NULL)
		listaTextos->primerTexto=texto;
	else{
		Texto_t* textoTmp= listaTextos->primerTexto;
		while(textoTmp->siguiente!=NULL){
			textoTmp=textoTmp->siguiente;
		}
		textoTmp->siguiente=texto;
	}
}


void agregarListaTextos(Nodo_t* nodo, ListaTextos_t* listaTextos){
	/*sto es por se se da la condicion
	 * <body>
	 * sjaklldsak<p>djskfldsjf</p> dsfjisipjfds
	 * </body>*/
	Texto_t* tmpTexto = nodo->listaTextos->primerTexto;
	if(tmpTexto!=NULL){
		while(tmpTexto->siguiente!=NULL){
			tmpTexto= tmpTexto->siguiente;
		}
		tmpTexto->siguiente= listaTextos->primerTexto;
	}
	else{
		nodo->listaTextos= listaTextos;
	}
}
ListaTextos_t* crearListaTextos(){
	ListaTextos_t* listaTextos = malloc(sizeof(ListaTextos_t));
	return listaTextos;
}

//IMpresión del arbol, el indice me indica en que nivel se encuentra
void printArregloEntero(int numero[30], int profundidad ){
	int i=0;
	while(profundidad--){
		printf(BLUE "%i."WHITE,numero[i]);
		i++;
	}
}
void printTabs(int cantidad){
	while(cantidad--){
		printf("    ");
	}
}
void imprimirDoctype(DocType_t* doctype){	
	printf("     "BLUE"1." RED" Doctype"GREEN " valor 1="YELLOW "%s "GREEN"valor 2 ="YELLOW " %s\n ",doctype->valor1, doctype->valor2);
}
void preImprimirArbol(Arbol_t* arbol){
	imprimirDoctype(arbol->doctype);
	int numero[30];
	numero[0]= 2;
	imprimirArbol(arbol->raizHtml->listaHijos->primerHijo,1,1, numero);;
}



void imprimirArbol(Nodo_t* raiz, int iProfundidad, int iAnchura, int numero[30]){
	if(raiz!=NULL){
		printTabs(iProfundidad);
		printArregloEntero(numero, iProfundidad);
		printf(RED" %s "WHITE, raiz-> nombreNodo);
		Atributo_t* atributoTmp= raiz->listaAtributos->primerAtributo;
		if(atributoTmp!=NULL){
			while(atributoTmp!=NULL){
				printf(GREEN " %s"WHITE "=" YELLOW" %s"WHITE,atributoTmp->nombreAtributo,atributoTmp->valorAtributo);
				atributoTmp= atributoTmp->siguiente;
			}
		}
		Texto_t* textoTmp = raiz->listaTextos->primerTexto;
		printf(CYAN" texto = "WHITE);
		if(textoTmp!=NULL){
			while(textoTmp!=NULL){
				printf(MAGENTA "%s "WHITE,textoTmp->texto);
				textoTmp= textoTmp->siguiente;
			}
		}
		printf("%s","\n");
		Nodo_t* nodoTmp= raiz->listaHijos->primerHijo;
		iAnchura=1;
		while(nodoTmp!=NULL){
			numero[iProfundidad]= iAnchura;
			imprimirArbol(nodoTmp, iProfundidad+1, iAnchura, numero);
			nodoTmp=nodoTmp->siguiente;
			iAnchura++;
		}
	}
}

DocType_t* crearDocType(char* valor1, char* valor2){
	DocType_t* nuevoDocType= malloc(sizeof(DocType_t));
	nuevoDocType->valor1=valor1;
	nuevoDocType->valor2=valor2;
	return nuevoDocType;
	
}
//Accion que se ejecuta cuando se lee una cabeza de un elemento html
void accionCabezaLeida_Arbl(char* nombreTag){
	agregarListaTextos(nodoActual,listaTextosActual);
	listaTextosActual= crearListaTextos();
	nodoActual= crearNodo(nombreTag,nodoActual); 
	ListaAtributos_t* listaTmp =listaAtributosActual;
	agregarListaAtributos(nodoActual,listaTmp);
	listaAtributosActual=crearListaAtributos();
}

//Accion que se ejecuta cuando se lee una cola de un elemento html
void accionColaLeida_Arbl(){
	agregarListaTextos(nodoActual,listaTextosActual);
	listaTextosActual= crearListaTextos();
	nodoActual= nodoActual->padre;
}
