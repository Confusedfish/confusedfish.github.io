---
title: Timeline
layout: landing
description: All of our previous jaunts
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
		
		{% for post in site.posts %}
		{% unless post.date > site.time %}
		{% if post.layout == "post" or post.layout contains "planning" %}
			<div class="item">
			  <div class="image">
				<div>
					<a href="{{ post.url }}">
					{% if post.thumbSquare %}
					<img src="{{ post.thumbSquare }}" alt="{{ post.image-caption }}"  />
					{% else %}
					<span class="noimage"></span>
					{% endif %}
					</a>
				  <span class="date">
				  {{ post.date | date_to_string }}
				  </span>
				</div>
			  </div>
			  <div class="details">
				<div><a href="{{ post.url }}">
				  <h1>
				 {{ post.title }}
				 </h1>
				  <p>{{ post.description }}</p>
				  </a>
				</div>
			  </div>
			</div>
		{% endif %}	
		{% endunless %}
		{% endfor %}
	</div>
</section>

</div>
