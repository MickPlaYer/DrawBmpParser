Compiler Program Exercise #2 - Syntax Analysis
	101820340 �Q�O�~

1. ��������
	a. Windows 8.1
	b. Ruby 2.2.3 + DevKit
	c. Racc 1.4.14 (Ruby yacc)
		�Ь�"ruby_racc_install_for_windows.txt"�C
2. �{������
	�o�ӵ{���ت��O�z�L���g�@�w�榡����r���e��ø�s�ϮסC
	�ϥ�Racc���ͪ�Parser�A�N��r���e�নBitmap���ɡC
	�����r�榡�Ь�"about_my_language.txt"�C
3. ���n�ɮ׻���
	a. draw_bmp_parser.y
		For Racc compile. �Ь�"about_racc_file.txt"�C
	b. lexer.rb
		²����RubyLexer�C
		�i�ƥ��]�wKeyword�H��Token�A�ñN��̥H[token,value]���Φ��^�ǵ�Parser�C
	c. example.txt, happy_face.txt
		���ե��ɮסC
	d. bmp_writer.rb, shapes.rb 
		ø�ϥ�Ruby�{���C
	e. test.rb
		�sĶ����Parser�C
		�z�Lcmd����
		cmd >> ruby test.rb
			�w�]�|Ū�Jexample.txt�ò���example.bmp�C
		cmd >> ruby test.rb test_file.txt
			Ū�Jtest_file.txt�ò���test_file.bmp�C
		