%token T_dl T_html T_script T_dt T_img T_span
	T_a T_dd T_input T_strong T_b T_em T_li
	T_style T_blockquote T_embed T_link T_table
	T_body T_footer T_meta T_td T_br T_form 
	T_object T_th T_button T_h1 T_h2 T_h3
	T_h4 T_h5 T_h6 T_ol T_tr T_caption T_head
	T_option T_textarea T_code T_header T_p T_title
	T_div T_hr T_pre T_ul T_Atributtes T_Values T_Text

%%

tag : a_tag
| html_tag
| script_tag
| dt_tag
| img_tag
| span_tag
| dl_tag
| dd_tag
|input_tag
|strong_tag
|b_tag
|em_tag
|li_tag
|style_tag
|blockquote_tag
|embed_tag
|link_tag
|table_tag
|body_tag
|footer_tag
|meta_tag
|td_tag
|br_tag
|form_tag
|object_tag
|th_tag
|button_tag
|h1_tag
|h2_tag
|h3_tag
|h4_tag
|h5_tag
|h6_tag
|ol_tag
|tr_tag
|caption_tag
|head_tag
|option_tag
|textarea
|code_tag
|header_tag
|p_tag
|title_tag
|div_tag
|hr_tag
|pre_tag
|ul_tag
;
a_tag : '<'T_a atributos'>' text '<''/'T_a'>'
;
html_tag : '<'T_html atributos'>' text '<''/'T_html'>' 
;
script_tag : '<'T_script atributos'>' text '<''/'T_script'>'
;
dt_tag : '<'T_dt atributos'>' text '<''/'T_dt'>'
;
img_tag : '<'T_img atributos'>' text '<''/'T_img'>'
;
span_tag : '<'T_span atributos'>' text '<''/'T_span'>'
;
dl_tag : '<'T_dl atributos'>' text '<''/'T_dl'>'
;
dd_tag : '<'T_dd atributos'>' text '<''/'T_dd'>'
;
input_tag : '<'T_input atributos'>' text '<''/'T_input'>'
;
strong_tag: '<'T_strong atributos'>' text '<''/'T_strong'>'
;
b_tag : '<'T_b atributos'>' text '<''/'T_b'>'
;
em_tag : '<'T_em atributos'>' text '<''/'T_em'>' 
;
li_tag : '<'T_li atributos'>' text '<''/'T_li'>'
;
style_tag : '<'T_style atributos'>' text '<''/'T_style'>'
;
blockquote_tag : '<'T_blockquote atributos'>' text '<''/'T_blockquote'>'
;
embed_tag : '<'T_embed atributos'>' text '<''/'T_embed'>'
;
link_tag : '<'T_link atributos'>' text '<''/'T_link'>'
;
table_tag : '<'T_table atributos'>' text '<''/'T_table'>'
;
body_tag : '<'T_body atributos'>' text '<''/'T_body'>'
;
footer_tag : '<'T_footer atributos'>' text '<''/'T_footer'>'
;
meta_tag : '<'T_meta atributos'>' text '<''/'T_a'>'
;
td_tag : '<'T_td atributos'>' text '<''/'T_td'>'
;
br_tag : '<'T_br atributos'>' text '<''/'T_br'>'
;
form_tag : '<'T_form atributos'>' text '<''/'T_form'>'
;
object_tag : '<'T_object atributos'>' text '<''/'T_object'>'
;
th_tag : '<'T_th atributos'>' text '<''/'T_a'>'
;
button_tag : '<'T_button atributos'>' text '<''/'T_button'>'
;
h1_tag : '<'T_h1 atributos'>' text '<''/'T_h1'>'
;
h2_tag : '<'T_h2 atributos'>' text '<''/'T_h2'>'
;
h3_tag : '<'T_h3 atributos'>' text '<''/'T_h3'>'
;
h4_tag : '<'T_h4 atributos'>' text '<''/'T_h4'>'
;
h5_tag : '<'T_h5 atributos'>' text '<''/'T_h5'>'
; 
h6_tag : '<'T_h6 atributos'>' text '<''/'T_h6'>'
;
ol_tag : '<'T_ol atributos'>' text '<''/'T_ol'>'
;
tr_tag : '<'T_tr atributos'>' text '<''/'T_tr'>'
;
caption_tag : '<'T_caption atributos'>' text '<''/'T_caption'>'
;
head_tag : '<'T_head atributos'>' text '<''/'T_head'>'
;
option_tag : '<'T_option atributos'>' text '<''/'T_option'>'
;
textarea : '<'T_textarea atributos'>' text '<''/'T_textarea'>'
;
code_tag : '<'T_code atributos'>' text '<''/'T_code'>'
; 
header_tag : '<'T_header atributos'>' text '<''/'T_header'>'
;
p_tag : '<'T_p atributos'>' text '<''/'T_p'>'
;
title_tag: '<'T_title atributos'>' text '<''/'T_title'>'
;
div_tag : '<'T_div atributos'>' text '<''/'T_div'>'
;
hr_tag : '<'T_hr atributos'>' text '<''/'T_hr'>'
;
pre_tag : '<'T_pre atributos'>' text '<''/'T_pre'>'
;
ul_tag : '<'T_ul atributos'>' text '<''/'T_ul'>'
;
atributos : T_Atributtes'='T_Values
;
text: T_Text
;

%%

int main() {
return yyparse();
}