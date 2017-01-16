---
title: Jaunt Tags
layout: page
description: Find a Jaunt by it's tag
nav-menu: true
---


<!-- Main -->
<div id="main" class="alt">

<!-- One -->
<section id="one">
	<div class="inner">
		<header class="major">
			<h1>Jaunt Tags</h1>
		</header>

		<!-- Content -->
		<p>Our jaunts take us to many places and we see many things. To help you find something that interests you we have tagged sections of each jaunt, pick from the following:</p>
		
		{% assign rawtags = "" %}
		{% for post in site.posts %}
			{% assign ttags = post.tags | join:'|' | append:'|' %}
			{% assign rawtags = rawtags | append:ttags %}
		{% endfor %}
		{% assign rawtags = rawtags | split:'|' | sort %}
		{% assign tags = "" %}
		{% for tag in rawtags %}
			{% if tag != "" %}
				{% if tags == "" %}
					{% assign tags = tag | split:'|' %}
				{% endif %}
				{% unless tags contains tag %}
					{% assign tags = tags | join:'|' | append:'|' | append:tag | split:'|' %}
				{% endunless %}
			{% endif %}
		{% endfor %}
	
		{% for tag in tags %}
			<a href="#{{ tag | slugify }}" class="button special small icon fa-tag"> {{ tag }} </a>&nbsp;
		{% endfor %}
	
	<p>&nbsp;</p>
	<p>&nbsp;</p>

	<dl>
		{% for tag in tags %}
			<dt id="{{ tag | slugify }}">{{ tag }}</dt>
			<dd><ul>
			 {% for post in site.posts %}
				 {% if post.tags contains tag %}
				 <li>
				 <a href="{{ post.url }}">
				 {{ post.title }}
				 <small>{{ post.date | date_to_string }}</small>
				 </a><br />
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
