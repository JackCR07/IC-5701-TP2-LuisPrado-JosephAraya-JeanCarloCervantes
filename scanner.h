/* Header para la declarion de las constantes, 
   variables tipos y funciones que se usan por
   el scanner generado de lex
 */

#ifndef _H_scanner
#define _H_scanner

#include <stdio.h>


  
/* Definicion de las constantes para los diferentes tipos de tokens.
 * Los numeros inician en 256, ya que de 0-255 estan reservados para
 * valores de single character token. 
 */
typedef enum {
	T_dl=256, T_html, T_script, T_dt, T_img, T_span,
	T_a, T_dd, T_input, T_strong, T_b, T_em, T_li,
	T_style, T_blockquote, T_embed, T_link, T_table,
	T_body, T_footer, T_meta, T_td, T_br, T_form, 
	T_object, T_th, T_button, T_h1, T_h2, T_h3,
	T_h4, T_h5, T_h6, T_ol, T_tr, T_caption, T_head,
	T_option, T_textarea, T_code, T_header, T_p, T_title,
	T_div, T_hr, T_pre, T_ul, T_Atributtes, T_Values, T_Text, T_XML, T_PublicIdentifier, T_DOCTYPE,
    T_NumTokenTypes
} TokenType;

 
// Lista de los printable names para cada valor del token definido anteriormente.
 
static const char *gTokenNames[T_NumTokenTypes] = {
  	"T_dl", "T_html", "T_script", "T_dt", "T_img", "T_span",
	"T_a", "T_dd", "T_input", "T_strong", "T_b", "T_em", "T_li",
	"T_style", "T_blockquote", "T_embed", "T_link", "T_table",
	"T_body", "T_footer", "T_meta", "T_td", "T_br", "T_form", 
	"T_object", "T_th", "T_button", "T_h1", "T_h2", "T_h3",
	"T_h4", "T_h5", "T_h6", "T_ol", "T_tr", "T_caption", "T_head",
	"T_option", "T_textarea", "T_code", "T_header", "T_p", "T_title",
	"T_div", "T_hr", "T_pre", "T_ul", "T_Atributtes", "T_Values",
	"T_Text", "T_XML", "T_PublicIdentifier", "T_DOCTYPE"
};

 
/* Definicion del tipo union usado por el scanner para almacenar
 * informacion de los atributos sobre los tokens como van siendo escaneados.
 */
typedef union {
    char *stringConstant;
} YYSTYPE;

 
// yylval contiene informacion del lexema escaneado

extern YYSTYPE yylval;

extern char *yytext;      // Texto del lexema escaneado

void OpenErrorFile();	// Abre archivo de errores
void CloseErrorFile();	// Cierra archivo de errores

int yylex();              // Definido en el archivo lex.yy.c generado


 
#endif
