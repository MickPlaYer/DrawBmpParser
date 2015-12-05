Compiler Program Exercise #2 - Syntax Analysis
	101820340 鄒令業

1. 執行環境
	a. Windows 8.1
	b. Ruby 2.2.3 + DevKit
	c. Racc 1.4.14 (Ruby yacc)
		請看"ruby_racc_install_for_windows.txt"。
2. 程式說明
	這個程式目的是透過撰寫一定格式的文字內容來繪製圖案。
	使用Racc產生的Parser，將文字內容轉成Bitmap圖檔。
	關於文字格式請看"about_my_language.txt"。
3. 重要檔案說明
	a. draw_bmp_parser.y
		For Racc compile. 請看"about_racc_file.txt"。
	b. lexer.rb
		簡易的RubyLexer。
		可事先設定Keyword以及Token，並將兩者以[token,value]的形式回傳給Parser。
	c. example.txt, happy_face.txt
		測試用檔案。
	d. bmp_writer.rb, shapes.rb 
		繪圖用Ruby程式。
	e. test.rb
		編譯完的Parser。
		透過cmd執行
		cmd >> ruby test.rb
			預設會讀入example.txt並產生example.bmp。
		cmd >> ruby test.rb test_file.txt
			讀入test_file.txt並產生test_file.bmp。
		