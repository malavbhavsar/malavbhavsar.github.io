---
layout: post
title:  "Rails configuration of my team ‘Where is Michael?’"
date:   2012-10-27 17:53:00
tags: [ruby, rails, config]
---
In my first semester at Carnegie Mellon, my favorite course is Introduction to Software Engineering. Students are divided in the teams of five and each team is assigned one VP of Engineering. Each team is supposed to follow XP and use rails to create a web application. Only one class in the week, team coding sessions, meeting with VP and more coding. Yeah, my favorite course.

What I have learnt from my previous team projects is: if you organize your team workflow and project configuration, it is easier to maintain your sanity. If you somehow manage to embed your workflow into your project configuration then you have won half the battle, seriously. Ruby, rails and the tools made available by the awesome community makes that task easier. Following are the tools that you really really should (feel free to read it as ‘must’) use if you are doing rails project.

### RVM

If you are not using RVM, you are going to have a really bad time. In simple words, this utility manages a different version of ruby and gems for each of your project. Imagine a scenario where a team member is using ruby 1.9.2 and the others are using 1.9.3, you are going to run into some serious demo day disasters. Every team member must use rvm and the .rvmrc file must be in the version control. If you are developing using Windows (I feel sorry for you), look into Pik. That’s all you have to do to avert a demo day disaster or a late night frenzy.

For quick intro to RVM: [http://screencasts.org/episodes/how-to-use-rvm](http://screencasts.org/episodes/how-to-use-rvm
)

### Bundler

I don’t think anyone can dare to embark upon a Ruby or Rails journey without using Bundler. RVM will manage your gems, but it is useful to have Bundler when your gems are going to change frequently.

Here is an article which explains how Bundler and RVM play together: [http://watirmelon.com/2011/01/17/easily-manage-your-rubies-with-rvm-bundler-and-pik/](http://watirmelon.com/2011/01/17/easily-manage-your-rubies-with-rvm-bundler-and-pik/)

### RubyMine

Our course instructors were super awesome to buy us an educational license for RubyMine. It has lots of awesome features. Here are the best ones: automatically detects the ruby version from `.rvmrc` file and uses that for the project, automatically detects gems which are not installed, `Alt+Ctrl+R -> all the available rake tasks`, `Alt+Ctrl+G -> all the available rails generators.`

That said, I still dream of the days when I will use just vim and bash or zsh. Until then, I am using IdeaVIM, which trains me to use VIM and Native Neighbourhood, which allows me to do Alt+Shift+S and get a shell. Btw, I strongly feel that RubyMine should have an inbuilt tab for shell.

If you can’t get RubyMine, get Aptana Studio. It’s more eclipse-ish and easy to work with and it has inbuilt tab for shell.

### Travis-ci

If you don’t have continuous integration server or don’t use it properly, you are going to die a horrible horrible death. Symptoms are questions like these “why something works on localhost but not on heroku?”, ”I know things are not working but when did they stop working? Which commit is at fault?”

We have set up the Travis-ci to run all our rspec and cucumber tests on two databases sqlite and postgresql. No more why-not-working-on-heroku problems. You can find an example `.travis.yml` file here: [https://github.com/malavbhavsar/CMU-RPG/blob/master/.travis.yml](https://github.com/malavbhavsar/CMU-RPG/blob/master/.travis.yml) and the corresponding rake task here: [https://github.com/malavbhavsar/CMU-RPG/blob/master/lib/tasks/travis_rspec_cucumber.rake](https://github.com/malavbhavsar/CMU-RPG/blob/master/.travis.yml)

Whenever someone pushes commit(s) on github, travi-ci hook detects that and runs all rspec and cucumber tests. Failed tests are mailed to the github repo owner. Set up filter and forward those emails to the team forum. Now, you can point at a person (at commit(s), if you don’t want to sound rude) and tell fix it, asap!

Travis-ci badge is a standard feature of almost any repo of the gem that you are using in your project, get a similar badge for your project and show off.

### Gemnasium

Gemnasium tracks your Gemfile and emails you if there is a patch, minor revision or major revision is available for a gem. Very useful, if a particular version isn't going to provide backward-compatibility or you want to use latest features.

It’s a badge, show off!

### Code climate

Everybody loves an A. Code climate gives A to F grades to each of your ruby file based on the complexity and duplication it has. It’s a good way to DRY out your code and get good grades!

Again, it’s a badge. Show it off you must!

Did I miss out anything? Are there any other awesome things out there? Please, comment!

EDIT: In my recent experience, I have noticed that for people who don’t specify the exact gem versions are prone to run into errors where their test cases start to fail and there might be no apparent reason for it in the code. This can happen in a case where the new versions of the gem has arrived and travis runs your tests with new versions of gem. Solution to this problem is to use the exact gem versions. Also, if one can trigger travis to run tests when new version of any gem listed in Gemfile is released. Gemnasium should start doing this. They can just create a .gemnasium file which is updated everytime a new version of any gem listed in Gemfile is released. This will trigger travis to run the tests.
