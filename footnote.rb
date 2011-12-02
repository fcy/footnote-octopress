# encoding: utf-8
#
# Title: Footnotes Liquid Tag
# Author: Felipe Cypriano <felipe@cypriano.me>
# Description: Make it easier to insert footnotes on your posts using <sup> and <a> tags.
#
# Usage:
#
# This text needs to point to a footnote{% fn_ref 1 %} because it's good{% fn_ref 2 %}.
#
# {% footnotes %}
#   {% fn A footnote is this text at the end of you page that explains something. %}
#   {% fn It's good because I like it. %}
# {% endfootnotes%}
#
# HTML generated
#
# This text needs to point to a footnote<sup id="fnref:1"><a href="#fn:1">1</a></sup> because it's good<sup id="fnref:2"><a href="#fn:2">2</a></sup>.
#
# <div class="footnotes">
# 	<ol>
# 		<li id="fn:1">A footnote is this text at the end of you page that explains something.<a href="#fnref:1">↩</a></li>
# 		<li id="fn:2">It's good because I like it.<a href="#fnref:2">↩</a></li>
# 	</ol>
# </div>
#


module Jekyll

	class FootnoteRefTag < Liquid::Tag
		def initialize(tag_name, markup, tokens)
		end

		def render(context)
		end
	end

end