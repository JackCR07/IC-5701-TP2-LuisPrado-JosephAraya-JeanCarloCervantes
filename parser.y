%{
void yyerror(char *s);
%}

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
;
doctype : '<' '!' T_DOCTYPE T_html T_PublicIdentifier T_Values '>'
;
html_tag : '<'T_html atributos '>' text head_tag body_tag text '<' '/' T_html '>' 
;
head_tag : '<' T_head atributos '>'text meta title_tag script_tag text '<' '/' T_head '>'
;
script_tag : '<' T_script atributos '>' text tag text '<' '/' T_script '>'
;
meta: '<' T_meta atributos '/' '>'
;
body_tag : '<' T_body atributos '>' text tag text '<' '/' T_body '>'
;
tag : a_tag 
| html_tag
| script_tag
| dt_tag
| img_tag
| span_tag
| dl_tag
| dd_tag
| input_tag
| strong_tag
| b_tag
| em_tag
| li_tag
| style_tag
| blockquote_tag
| embed_tag
| link_tag
| table_tag
| body_tag
| footer_tag
| td_tag
| br_tag
| form_tag
| object_tag
| th_tag
| button_tag
| h1_tag
| h2_tag
| h3_tag
| h4_tag
| h5_tag
| h6_tag
| ol_tag
| tr_tag
| caption_tag
| head_tag
| option_tag
| textarea
| code_tag
| header_tag
| p_tag
| title_tag
| div_tag
| hr_tag
| pre_tag
| ul_tag
| meta
;
a_tag : '<' T_a atributos '>' text tag text '<' '/' T_a '>'
;
em_tag : '<' T_em atributos '>' text tag text '<' '/' T_em '>' 
;
dt_tag : '<' T_dt atributos '>'text tag text '<' '/' T_dt '>'
;
img_tag : '<' T_img atributos '>' text tag text '<' '/' T_img '>'
;
span_tag : '<' T_span atributos '>'text tag text '<' '/' T_span '>'
;
dl_tag : '<' T_dl atributos '>' text tag text '<' '/' T_dl '>'
;
dd_tag : '<' T_dd atributos '>' text tag text '<' '/' T_dd '>'
;
b_tag : '<' T_b atributos '>' text tag text '<' '/' T_b '>'
;
li_tag : '<' T_li atributos '>' text tag text '<' '/' T_li '>'
;
strong_tag: '<' T_strong atributos '>' text tag text '<' '/' T_strong '>'
;
style_tag : '<' T_style atributos '>' text tag text '<' '/' T_style '>'
;
blockquote_tag : '<' T_blockquote atributos '>' text tag text '<' '/' T_blockquote '>'
;
embed_tag : '<' T_embed atributos '>' text tag text '<' '/' T_embed '>'
;
link_tag : '<' T_link atributos '>' text tag text '<' '/' T_link '>'
;
table_tag : '<' T_table atributos '>' text tag text '<' '/' T_table '>'
;
footer_tag : '<' T_footer atributos '>' text tag text '<' '/' T_footer '>'
;
td_tag : '<' T_td atributos '>' text tag text '<' '/' T_td '>'
;
br_tag : '<' T_br atributos '>' text tag text '<' '/' T_br '>'
;
form_tag : '<' T_form atributos'>' text tag text '<' '/' T_form '>'
;
object_tag : '<' T_object atributos '>' text tag text '<' '/' T_object '>'
;
th_tag : '<' T_th atributos '>' text tag text '<' '/' T_th '>'
;
button_tag : '<' T_button atributos '>' text tag text '<' '/' T_button '>'
;
h1_tag : '<' T_h1 atributos '>' text tag text '<' '/' T_h1 '>'
;
h2_tag : '<' T_h2 atributos '>' text tag text '<' '/' T_h2 '>'
;
h3_tag : '<' T_h3 atributos '>' text tag text '<' '/' T_h3 '>'
;
h4_tag : '<' T_h4 atributos '>' text tag text '<' '/' T_h4 '>'
;
h5_tag : '<' T_h5 atributos '>' text tag text '<' '/' T_h5 '>'
; 
h6_tag : '<' T_h6 atributos '>' text tag text '<' '/' T_h6 '>'
;
ol_tag : '<' T_ol atributos '>' text tag text '<' '/' T_ol '>'
;
tr_tag : '<' T_tr atributos '>' text tag text '<' '/' T_tr '>'
;
caption_tag : '<' T_caption atributos '>' text tag text '<' '/' T_caption '>'
;
option_tag : '<' T_option atributos '>' text tag text '<' '/' T_option '>'
;
textarea : '<' T_textarea atributos '>' text tag text '<' '/' T_textarea '>'
;
code_tag : '<' T_code atributos '>' text tag text '<' '/' T_code '>'
; 
header_tag : '<' T_header atributos '>' text tag text '<' '/' T_header '>'
;
p_tag : '<' T_p atributos '>' text tag text '<' '/' T_p '>'
;
title_tag: '<' T_title atributos '>' text tag text '<' '/' T_title '>'
;
div_tag : '<' T_div atributos '>' text tag text '<' '/' T_div '>'
;
hr_tag : '<' T_hr atributos '>' text tag text '<' '/' T_hr '>'
;
pre_tag : '<' T_pre atributos '>' text tag text '<' '/' T_pre '>'
;
ul_tag : '<' T_ul atributos '>' text tag text '<' '/' T_ul '>'
;
input_tag : '<' T_input atributos '>' text tag text '<' '/' T_input '>'
;
atributos : T_Atributtes'='T_Values atributos
|
;
text: T_Text
|
;

%%

int main() {
return yyparse();
}

void yyerror(char *s)
{

}
