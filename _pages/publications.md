---
title: "Publications"
permalink: /publications/
description: "Publications by Joon Suk Huh in online machine learning, game theory, and mechanism design."
---

<div class="publications-intro">
  <p>Also on <a href="{{ site.author.googlescholar }}">Google Scholar <span aria-hidden="true">↗</span></a>.</p>
  <p class="publication-note">* denotes lead / joint lead author(s).</p>
</div>

{% assign publications = site.publications | sort: 'date' | reverse %}
{% assign years = publications | group_by_exp: 'publication', "publication.date | date: '%Y'" %}
{% for year in years %}
<section class="publication-year" aria-labelledby="year-{{ year.name }}">
  <h2 id="year-{{ year.name }}">{{ year.name }}</h2>
  <ul class="publication-list">
    {% for publication in year.items %}
    <li>
      <article class="publication">
        <h3>{{ publication.title }}</h3>
        <div class="publication-details">{{ publication.excerpt | markdownify }}</div>
      </article>
    </li>
    {% endfor %}
  </ul>
</section>
{% endfor %}
