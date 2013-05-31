%{
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
;
doctype : '<''!'dctype html pblid values values'>' { printf("doctype");}
;
html_tag : '<'html atributos '>'  head_h body'<' '/' html '>' {printf("html_Tag");}
;
head_h : '<' head atributos '>' head_tag
;
head_tag :  infoh head_t 
;
head_t : '<' '/' head '>' { printf("head_tag"); }
;
infoh : meta title_h
| title_h
;
meta : '<' T_meta atributos '/' '>' {printf("meta_tag");}
;
body : '<' T_body atributos '>' body_tag
;
body_tag :  tags body_tag
| body_t
;
body_t : '<' '/' T_body '>' {printf("body_tag");}
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
a_h : '<' T_a atributos '>' a_tag
;
em_h : '<' T_em atributos '>' em_tag
;
dt_h : '<' T_dt atributos '>' dt_tag
;
img_h : '<' T_img atributos '/''>' img_tag
;
span_h : '<' T_span atributos '>' span_tag
;
dl_h : '<' T_dl atributos '>' dl_tag
;
dd_h : '<' T_dd atributos '>' dd_tag
;
b_h : '<' T_b atributos '>' b_tag
;
li_h : '<' T_li atributos '>' li_tag
;
strong_h: '<' T_strong atributos '>' strong_tag
;
style_h : '<' T_style atributos '>' style_tag
;
blockquote_h : '<' T_blockquote atributos '>' blockquote_tag
;
embed_h : '<' T_embed atributos '>' embed_tag
;
link_h : '<' T_link atributos '>' link_tag
;
table_h : '<' T_table atributos '>' table_tag
;
footer_h : '<' T_footer atributos '>' footer_tag
;
td_h : '<' T_td atributos '>' td_tag
;
br_h : '<' T_br atributos '>' br_tag
;
form_h : '<' T_form atributos'>' form_tag
;
object_h : '<' T_object atributos '>' object_tag
;
th_h : '<' T_th atributos '>' th_tag
;
button_h : '<' T_button atributos '>' button_tag
;
h1_h : '<' T_h1 atributos '>' h1_tag
;
h2_h : '<' T_h2 atributos '>' h2_tag
;
h3_h : '<' T_h3 atributos '>' h3_tag
;
h4_h : '<' T_h4 atributos '>' h4_tag
;
h5_h : '<' T_h5 atributos '>' h5_tag
; 
h6_h : '<' T_h6 atributos '>' h6_tag
;
ol_h : '<' T_ol atributos '>' ol_tag
;
tr_h : '<' T_tr atributos '>' tr_tag
;
caption_h : '<' T_caption atributos '>' caption_tag
;
option_h : '<' T_option atributos '>' option_tag
;
textarea : '<' T_textarea atributos '>' textarea_tag
;
code_h : '<' T_code atributos '>' code_tag
; 
header_h : '<' T_header atributos '>' header_tag
;
p_h : '<' T_p atributos '>' p_tag
;
title_h: '<' T_title atributos '>' title_tag
;
div_h : '<' T_div atributos '>' div_tag
;
hr_h : '<' T_hr atributos '>' hr_tag
;
pre_h : '<' T_pre atributos '>' pre_tag
;
ul_h : '<' T_ul atributos '>' ul_tag
;
input_h : '<' T_input atributos '>' input_tag 
;
a_tag : info tags a_t
| info a_t
| a_t
;
a_t : '<' '/' T_a '>' infos
;
em_tag : info tags em_t
| info em_t
| em_t
;
em_t : '<' '/' T_em '>' infos
;
dt_tag : info tags dt_t
| info dt_t
| dt_t
;
dt_t : '<' '/' T_dt '>' infos
;
img_tag : info 
;
span_tag : info tags span_t
| info span_t
| span_t
;
span_t : '<' '/' T_span '>' infos
;
dl_tag : info tags dl_t
| info dl_t
| dl_t
;
dl_t : '<' '/' T_dl '>' infos
;
dd_tag : info tags dd_t
| info dd_t
| dd_t
;
dd_t : '<' '/' T_dd '>' infos
;
b_tag : info tags b_t
| info b_t
| b_t
;
b_t : '<' '/' T_b '>' infos
;
li_tag : info tags li_t
| info li_t
| li_t
;
li_t : '<' '/' T_li '>' infos
;
strong_tag : info tags strong_t
| info strong_t
| strong_t
;
strong_t : '<' '/' T_strong '>' infos
;
style_tag : info tags style_t
| info style_t
| style_t
;
style_t : '<' '/' T_style '>' infos
;
blockquote_tag : info tags blockquote_t
| info blockquote_t
| blockquote_t
;
blockquote_t : '<' '/' T_blockquote '>' infos
;
embed_tag : info tags embed_t
| info embed_t
| embed_t
;
embed_t : '<' '/' T_embed '>' infos
;
link_tag : info tags link_t
| info link_t
| link_t
;
link_t : '<' '/' T_link '>' infos
;
table_tag : info tags table_t
| info table_t
| table_t
;
table_t : '<' '/' T_table '>' infos
;
footer_tag : info tags footer_t
| info footer_t
| footer_t
;
footer_t : '<' '/' T_footer '>' infos
;
td_tag : info tags td_t
| info td_t
| td_t
;
td_t : '<' '/' T_td '>' infos
;
br_tag : info tags br_t
| info br_t
| br_t
;
br_t : '<' '/' T_br '>' infos
;
form_tag : info tags form_t
| info form_t
| form_t
;
form_t : '<' '/' T_form '>' infos
;
object_tag : info tags object_t
| info object_t
| object_t
;
object_t : '<' '/' T_object '>' infos
;
th_tag : info tags th_t
| info th_t
| th_t
;
th_t : '<' '/' T_th '>' infos
;
button_tag : info tags button_t
| info button_t
| button_t
;
button_t : '<' '/' T_button '>' infos
;
h1_tag : info tags h1_t
| info h1_t
| h1_t
;
h1_t : '<' '/' T_h1 '>' infos
;
h2_tag : info tags h2_t
| info h2_t
| h2_t
;
h2_t : '<' '/' T_h2 '>' infos
;
h3_tag : info tags h3_t
| info h3_t
| h3_t
;
h3_t : '<' '/' T_h3 '>' infos
;
h4_tag : info tags h4_t
| info h4_t
| h4_t
;
h4_t : '<' '/' T_h4 '>' infos
;
h5_tag : info tags h5_t
| info h5_t
| h5_t
;
h5_t : '<' '/' T_h5 '>' infos
; 
h6_tag : info tags h6_t
| info h6_t
| h6_t
;
h6_t : '<' '/' T_h6 '>' infos
;
ol_tag : info tags ol_t
| info ol_t
| ol_t
;
ol_t : '<' '/' T_ol '>' infos
;
tr_tag : info tags tr_t
| info tr_t
| tr_t
;
tr_t : '<' '/' T_tr '>' infos
;
caption_tag : info tags caption_t
| info caption_t
| caption_t
;
caption_t : '<' '/' T_caption '>' infos
;
option_tag : info tags option_t
| info option_t
| option_t
;
option_t : '<' '/' T_option '>' infos
;
textarea_tag : info tags textarea_t
| info textarea_t
| textarea_t
;
textarea_t : '<' '/' T_textarea '>' infos
;
code_tag : info tags code_t
| info code_t
| code_t
;
code_t : '<' '/' T_code '>' infos
; 
header_tag : info tags header_t
| info header_t
| header_t
;
header_t : '<' '/' T_header '>' infos
;
p_tag : info tags p_t
| info p_t
| p_t
;
p_t : '<' '/' T_p '>' infos {printf("p_Tag");}
; 
title_tag : info title_t
| title_t
;
title_t : '<' '/' T_title '>' {printf("title_tag");}
;
div_tag : info tags div_t
| info div_t
| div_t
;
div_t : '<' '/' T_div '>' infos
;
hr_tag : info tags hr_t
| info hr_t
| hr_t
;
hr_t : '<' '/' T_hr '>' infos
;
pre_tag : info tags pre_t
| info pre_t
| pre_t
;
pre_t : '<' '/' T_pre '>' infos
;
ul_tag : info tags ul_t
| info ul_t
| ul_t
;
ul_t : '<' '/' T_ul '>' infos
;
input_tag : info tags input_t
| info input_t
| input_t
;
input_t : '<' '/' T_input '>' infos
;
atributos : T_Atributtes'='T_Values atributos 
|
;
text :T_Text
;
html : T_html
;
dctype : T_DOCTYPE
;
pblid : T_PublicIdentifier
;
values : T_Values 
;
head : T_head
;
infos:
| text infos
;
info : text infos
| tags
;
%%

int main() {
return yyparse();
}

void yyerror(char *s)
{
	printf("%s","FAAAAAAAAAAAAAAAAAIL");
}
