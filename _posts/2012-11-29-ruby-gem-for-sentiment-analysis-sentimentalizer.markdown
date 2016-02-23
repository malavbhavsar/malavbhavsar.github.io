---
layout: post
title:  "RubyGem for Sentiment Analysis: Sentimentalizer"
date:   2012-11-29 04:31:00
tags: [ruby, gem, machine-learning, sentiment-analysis]
---
So, this month we had a Pittsburgh hackathon organized by facebook. I teamed up with Ruchir Patwa and made a simple web-app. It gets facebook status messages of one’s friends and predicts whether they are happy or sad by doing sentiment analysis. [Here](https://github.com/malavbhavsar/Friends-mood) is the github repo of the project.

In the process, I made my first gem: [sentimentalizer](https://github.com/malavbhavsar/sentimentalizer). It takes inspiration from a [project](https://github.com/kouphax/sentimentalizer/) by James Hughes.

This was supposed to be a learning experience for me on how to make gems. So here it is: One can start with the [make your own gem](http://guides.rubygems.org/make-your-own-gem/) guide by the rubygems. It gives a fast tour of a typical gem’s anatomy. After getting the basics right, one can start using [jeweler](https://github.com/technicalpickles/jeweler). It makes building gems super easy. Warning: if you don’t do things right way with jeweler, your commit log will look like a war zone. It happened with me.
