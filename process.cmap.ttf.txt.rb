#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
#-----------------------------------------------------------------------------
#	ttf フォントの cmap 領域から、保持しているグリフの一覧テキストを作る
#	
#	
#	2017-09-22
#-----------------------------------------------------------------------------
require 'pp'
require 'fileutils'
require 'date'
require 'time'
require 'strscan'

Encoding.default_external="utf-8"
#-----------------------------------------------------------------------------
#	
#-----------------------------------------------------------------------------
settings = {
	
}



#-----------------------------------------------------------------------------
#	
#-----------------------------------------------------------------------------
def main( settings )
#	filename = "msgothic001.cmap.ttf.txt"
#	filename = "meiryo001.cmap.txt"
	filename = ARGV[ 0 ]
	if filename.nil? || filename == ""
		$stderr.puts "filename がありません."
		exit 1
	end
	
	flag_in_target = false
	
	code_points = []
	
	
	File.foreach( filename ) do |line|
		
		
		if flag_in_target
			# ターゲット内
			if /^\S/ === line
				flag_in_target = false
				
			end
			
			if /\bChar\b\s+(?<hex>[0-9a-zA-Z]+)/ === line
				code_point_str = $~[ :hex ]
				code_points << code_point_str.hex
			end
			
			
			
			
		else
			# ターゲット外
			if /Specific ID:   10$/ === line
				flag_in_target = true
			end
		end
		
		
	end
	
	pre_code_line = -1
	code_points.each do |c|
		next if c == 0
		
		if pre_code_line != c >> 4
			print( "\n" )
			
			pre_code_line = c >> 4
			
		end
		
		
=begin
		if c % 16 == 0
			print( "\n" )
		end
=end
		print( c.chr Encoding::UTF_8 )
		
	end
	
	puts ""
	puts "----"
	
end

main( settings )
