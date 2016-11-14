require 'nokogiri'
require 'open-uri'
require 'cgi'
require "bing_dictionary/version"

module BingDictionary
  class Base
    attr_reader :doc

    def self.translate(word, options = {})
      self.new(word, options).translate
    rescue SocketError
      warn 'Connection failed! Please check your network.'
      exit 1
    end

    def initialize(word, options = {})
      file = open("http://cn.bing.com/dict/?q=#{CGI::escape(word)}")
      @doc = Nokogiri::HTML(file)
      @options = options
    end

    def translate
      head if doc.at_css('#headword')
      machine if doc.at_css('.smt_hw')
      sentence if doc.at_css('#sentenceSeg .se_li')
      guess if doc.at_css('.dym_area')
      pronounce if doc.at_css('#headword') && @options[:pronounce]
    end

    def head
      puts doc.at_css('#headword').text
      puts doc.at_css('.hd_tf_lh').text.green
      puts
      doc.at_css('.hd_area').next_sibling.css('li').each do |li|
        puts li.at_css('.pos').text.fixed(5).blue + li.at_css('.def').text
      end
    end

    def pronounce
      url = doc.at_css('.hd_tf_lh .hd_tf a').attr('onclick').match(/http.*mp3/)
      `curl -o /tmp/dict.mp3 #{url} &> /dev/null`
      `afplay /tmp/dict.mp3`
    end

    def machine
      puts doc.at_css('.smt_hw').text
      puts doc.at_css('.p1-10').text
      puts doc.at_css('.p1-11').text.green
    end

    def sentence
      puts
      doc.css('#sentenceSeg .se_li').first(4).map do |li|
        puts li.css('.sen_en').text
        puts li.css('.sen_cn').text
        puts
      end
    end

    def guess
      puts
      content = doc.at_css('.content')
      puts content.at_css('.p2-2').text
      puts

      content.css('.dym_area').each do |area|
        puts area.at_css('.df_wb_a').text
        puts area.css('.df_wb_c').map(&:text)
        puts
      end
    end

  end

end

class String
  COLORS = %w(black red green yellow blue magenta cyan white)
  COLORS.each_with_index do |color, idx|
    define_method color do
      "\e[3#{idx}m" << self.to_s << "\e[0m"
    end

    define_method "#{color}_bg" do
      "\e[4#{idx}m" << self.to_s << "\e[0m"
    end
  end

  def fixed(width)
    width = width - self.each_char.count { |c| c =~ /\p{Han}/ }
    width > 0 ? ("%-#{width}s" % self) : self
  end
end
