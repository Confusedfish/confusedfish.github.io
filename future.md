---
title: Future Plans
layout: landing
description: 'Possible future travels'
image: assets/images/pic07.jpg
nav-menu: true
---


<!-- Main -->
<div id="main" class="alt">

<!-- One -->
<section id="one">
	<div class="inner">
		<header class="major">
			<h1>{{page.description}}</h1>
		</header>

		<!-- Content -->
		<p>It's best to have a plan, here are some future jaunts we have in mind:</p>
		
		<ul> 
		{% assign filteredPosts = site.plans | where: 'planning', true | where_exp: 'item','item.sitemap' %}
		{% for post in filteredPosts %}
		{% if post.date > site.time %}
		{% if post.layout == "post" or post.layout contains "planning" %}
				 <li>
				 <a href="{{ post.url }}">
				 {{ post.title }}
				 </a><br />
				 <p>{{ post.description }}</p>
				 </li>
		{% endif %}	
		{% endif %}	
		{% endfor %}	
	</ul>
	</div>
</section>

</div>
