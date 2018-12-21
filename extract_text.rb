# coding: utf-8
require "nokogiri"

def merge_lines(lines)
  merged_lines = []
  
  for line in lines
    if merged_lines.empty?
      merged_lines << line
    elsif line =~ /^\s*$/
      merged_lines << line
    elsif merged_lines[-1] =~ /^\s*$/
      merged_lines << line
    else
      merged_lines[-1] += line
    end
  end

  merged_lines
end

def fix_text(text)
  text.gsub(/[๐-๙]/) {|m| (m.ord + '1'.ord - '๑'.ord).chr}
    .gsub(/([่้๊๋])([ัุูิีึื])/, '\2\1')
    .gsub(/([ัุูิีึื])\s+([่้๊๋])/, '\1\2')
    .gsub(/\s+([ัุูิีึื])/, '\1')
    .gsub(//, '้')
    .gsub(//, '่')
    .gsub(/([เแ])([ิีึื])/, '\2\1')
end

def extract(node)
  children = node.children.map{|child| extract(child)}

  if children.empty?
    {type: :simple, text: node.text}
  elsif children.all?{|child| child[:type] == :simple}
    if node.name == "p" or node.name == "div"
      {type: :complex, text: node.text}
    else
      {type: :simple, text: node.text}
    end
  else #complex
    text = children.map{|child| child[:text]}.join("\n")
    {type: :complex, text: text}
  end
end

doc = Nokogiri::HTML($stdin.read)
body = doc.xpath('/html/body')[0]
body_text = extract(body)[:text]
lines = body_text.split(/\r?\n/)
print merge_lines(lines).join("\n")
