---
layout: page
title: Countries
description: Our Jaunts arranged by Country
image: assets/images/pic11.jpg
nav-menu: true
---

<!-- Main -->
<div id="main" class="alt">

<!-- One -->
<section id="one">
	<div class="inner">
		<header class="major">
			<h1>Countries</h1>
		</header>

		<!-- Content -->
		<p>All our jaunts broken down by country:</p>
		
		{% assign postsOfInterest = site.posts | where_exp : "post","post.layout <> 'subpost'" %}
		{% assign postsOfInterest = postsOfInterest | where_exp : "post","post.layout <> null" %}
		{% assign rawcats = "" %}
		{% for post in postsOfInterest %}
		{% assign tcats = post.country | join:'|' | append:'|' %}
		{% assign rawcats = rawcats | append:tcats %}
		{% endfor %}

		{% assign rawcats = rawcats | split:'|' | sort %}

		{% assign cats = "" %}

		{% for cat in rawcats %}
		{% if cat != "" %}

		{% if cats == "" %}
		{% assign cats = cat | split:'|' %}
		{% endif %}

		{% unless cats contains cat %}
		{% assign cats = cats | join:'|' | append:'|' | append:cat | split:'|' %}
		{% endunless %}
		{% endif %}
		{% endfor %}

		{% for ct in cats %}
			<a href="#{{ ct | slugify }}" class="button special small icon fa-globe"> {{ ct }} </a>&nbsp;
		{% endfor %}
	
	<p>&nbsp;</p>
	<p>&nbsp;</p>

	<dl>
		{% for ct in cats %}
			<dt id="{{ ct | slugify }}">{{ ct }}</dt>
			<dd><ul>
			 {% for post in postsOfInterest %}
				 {% if post.country contains ct %}
				 <li>
				 <a href="{{ post.url }}">
				 {{ post.title }}
				 <small>{{ post.date | date_to_string }}</small>
				 </a>{% if post.planning %}&nbsp;&nbsp;<i>*planned</i>{% endif %}<br />
				 <p>{{ post.description }}</p>
				 </li>
				 {% endif %}
			 {% endfor %}
			</ul></dd>
		{% endfor %}	
	</dl>
	</div>
</section>

</div>
