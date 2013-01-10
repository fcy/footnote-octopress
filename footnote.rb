# encoding: utf-8
#
# Title: Footnotes Liquid Tag
# Author: Felipe Cypriano <felipe@cypriano.me>
# Description: Make it easier to insert footnotes on your posts using <sup> and <a> tags.
#
# Usage:
#
# This text needs to point to a footnote{% fn_ref 1 %} because it's good{% footnote_ref 2 %}.
#
# {% footnotes %}
#   {% fn %} A footnote is this text at the end of you page that explains something.
#   {% fn %} It's good because I like it.
# {% endfootnotes%}
#
# HTML generated
#
# This text needs to point to a footnote<sup id="fnref:1"><a href="#fn:1" rel="footnote">1</a></sup> because it's good<sup id="fnref:2"><a href="#fn:2" rel="footnote">2</a></sup>.
#
# <div class="footnotes">
# 	<ol>
# 		<li id="fn:1">A footnote is this text at the end of you page that explains something.<a href="#fnref:1" rev="footnote">↩</a></li>
# 		<li id="fn:2">It's good because I like it.<a href="#fnref:2" rev="footnote">↩</a></li>
# 	</ol>
# </div>
#


module Footnote

	class ReferenceTag < Liquid::Tag
		def initialize(tag_name, ref, tokens)
			super
			@reference = ref.strip unless ref.nil?
		end

		def render(context)
			unless @reference.nil?
				"<sup id='fnref:#{@reference}'><a href='#fn:#{@reference}' rel='footnote'>#{@reference}</a></sup>"
			end
		end
	end

	class FootnotesBlock < Liquid::Block
		def initialize(tag_name, markup, tokens)
			@footnotes = []
			@current_reference = 1
			super
		end

		def render(context)
			<<-end_html
<div class="footnotes">
	<ol>
		#{@footnotes.join}
	</ol>
</div>
			end_html
		end

		def unknown_tag(name, params, tokens)
			if name == 'fn'
				text = tokens.shift || params
				handle_fn_tag(text)
			else
				super
			end
		end

		private
		
		def handle_fn_tag(text)
			ref_text = RDiscount.new("#{text}<a href='#fnref:#{@current_reference}' rev='footnote'>↩</a>").to_html
			@footnotes << "<li id='fn:#{@current_reference}'>#{ref_text}</li>"
			@current_reference += 1
		end
	end
end

Liquid::Template.register_tag('footnote_ref', Footnote::ReferenceTag)
Liquid::Template.register_tag('fn_ref', Footnote::ReferenceTag)
Liquid::Template.register_tag('footnotes', Footnote::FootnotesBlock)
