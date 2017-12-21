---
layout: null
permalink: sitemap.xml
sitemap: false
---
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
  {% for post in site.posts %}
    {% unless post.published == false %}
    {% unless post.sitemap == false %}
    <url>
      <loc>{{ site.url }}{{ post.url }}</loc>
	  {% assign postDate = post.last_modified_at | default : post.date | default : site.time %}
	  {% if postDate > site.time %}
	  {% assign postDate = site.time %}
	  {% endif %}
	  {% unless post.layout=="subpost" %}
		{% assign subPosts = site.posts | where: 'group', post.group %}
		{% for subpage in subPosts %}
			{% assign subpageDate = subpage.date %}
			{% if subpage.last_modified_at %}
			{% assign subpageDate = subpage.last_modified_at %}
			{% endif %}
			{% if subpageDate > site.time %}
			{% assign subpageDate = site.time %}
			{% endif %}
			{% if subpageDate > postDate %}
			{% assign postDate = subpageDate %}
			{% endif %}
		{% endfor %}
	  {% endunless %}
	  <lastmod>{{ postDate | date_to_xmlschema }}</lastmod>
      {% if post.sitemap.changefreq %}
        <changefreq>{{ post.sitemap.changefreq }}</changefreq>
      {% else %}
        <changefreq>monthly</changefreq>
      {% endif %}
      {% if post.sitemap-priority %}
        <priority>{{ post.sitemap-priority }}</priority>
      {% else %}
		{% if post.layout=="post" %}
        <priority>0.4</priority>
	    {% else %}
        <priority>0.5</priority>
        {% endif %}
      {% endif %}
    </url>
    {% endunless %}
    {% endunless %}
  {% endfor %}
  {% for page in site.pages %}
    {% unless page.sitemap == false %}
    {% if page.layout %}
    <url>
      <loc>{{ site.url }}{{ page.url | remove: "index.html" }}</loc>
      {% if page.sitemap.lastmod %}
        <lastmod>{{ page.sitemap.lastmod | date: "%Y-%m-%d" }}</lastmod>
      {% elsif page.date %}
        <lastmod>{{ page.date | date_to_xmlschema }}</lastmod>
      {% else %}
        <lastmod>{{ site.time | date_to_xmlschema }}</lastmod>
      {% endif %}
      {% if page.sitemap.changefreq %}
        <changefreq>{{ page.sitemap.changefreq }}</changefreq>
      {% else %}
        <changefreq>monthly</changefreq>
      {% endif %}
      {% if page.sitemap.priority %}
        <priority>{{ page.sitemap.priority }}</priority>
      {% else %}
        <priority>0.3</priority>
      {% endif %}
    </url>
    {% endif %}
    {% endunless %}
  {% endfor %}
</urlset>