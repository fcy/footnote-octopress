What is?
--------

A custom Liquid tag and block to be used with Jekyll/Octopress to generate footnotes.

Inlcudes a JavaScript to generate a popover on mouseover.

Original JavaScript from [LukasMathis](http://ignorethecode.net/blog/2010/04/20/footnotes/).

How To Use?
-----------

```
This text needs to point to a footnote{% fn_ref 1 %} because it's good{% footnote_ref 2 %}.

{% footnotes %}
  {% fn %} A footnote is this text at the end of you page that explains something.
  {% fn %} It's good because I like it.
{% endfootnotes%}
```

Output:

``` html
<p>This text needs to point to a footnote<sup id="fnref:1"><a href="#fn:1" rel="footnote">1</a></sup> because it's good<sup id="fnref:2"><a href="#fn:2" rel="footnote">2</a></sup>.</p>

<div class="footnotes">
	<ol>
		<li id="fn:1">A footnote is this text at the end of you page that explains something.<a href="#fnref:1" rev="footnote">↩</a></li>
		<li id="fn:2">It's good because I like it.<a href="#fnref:2" rev="footnote">↩</a></li>
	</ol>
</div>
```

Both <code>fn_ref</code> and <code>footnote_ref</code> means the same thing.
Use the one you prefer.

How To Install in Octopress
---------------------------

It's pretty simple:

1. Copy <code>footnote.rb</code> to <code>OCTOPRESS_DIR/plugins</code>
2. Copy <code>footnote.scss</code> to <code>OCTOPRESS_DIR/sass/custom</code>
3. Edit <code>OCTOPRESS_DIR/sass/custom/_styles.scss</code> to import <code>footnote.scss</code>:

``` scss
@import "footnote";
```

To install the JavaScript:

1. Copy <code>footnote.js</code> to <code>OCTOPRESS_DIR/source/javascripts</code>
2. Edit <code>OCTOPRESS_DIR/source/_includes/custom/head.html</code> to load jQuery and footnote.js<code>footnote.scss</code>:

``` html
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js" type="text/javascript"></script>
<script src="{{ root_url }}/javascripts/footnote.js" type="text/javascript"></script>
```

License
-------

(The MIT License)

Copyright © 2011 Felipe Cypriano

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the ‘Software’), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED ‘AS IS’, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
