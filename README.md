Introduction
------------

Pragmapress is a collection of command-line tools that allow one to use the
wordpress.com website from the command line. It is designed to handle multiple
blogs. In fact, pragmapress has always been on my todo-list, but for the last
few years I didn't have enough incentive to make it. Now that I have more than
20 blogs on wordpress.com, I had to find a way to streamline my workflow.

Pragmapress doesn't just support publishing, editing and deleting of posts. It
also supports writing posts in asciidoc. This means that pragmapress enables
one to use the unix command-line for all phases of the blogging process.

In order to use pragmapress you need to register a developer client on:
https://developer.wordpress.com/apps/

Once you do that, you can put your credentials in cred.json, in this
repository's root directory. The format is as follows.

	{
		"username": "my_wordpress_username",
		"password": "my_wordpress_password",
		"clientid": 12345,
		"editor": "vim"
	}

You can get your client id, by going to https://developer.wordpress.com/apps/
and clicking on 'manage application'. The ID will be appended to the end of
that URL. Copy it into cred.js

Your posts are organized in the `blog/` directory. Each blog is stored as a
directory called `blog/$sitename.wordpress.com`. In each blog's directory you
have the following subdirectories: `posts` and `pages`. Each of _those_
subdirectories contain content directories. A content directory contains
content. The only file that should be in there is a `<filename>`.txt file. Once
you create your blog online, you should execute `wpsync` to create a new
directory for that blog.

	cd tools
	./wpsync

`wpsync` automatically gets a list of the blogs you own and creates new
directories for any blogs it doesn't have on record. Once you do that you can
begin writing and publishing posts and pages. To write a new post on
myblog.wordpress.com do the following:

	./edit myblog posts mypost

This will drop you into your preferred editor, from where you can write the
post in asciidoc. Once you finish writing, you can exit the editor. To publish
the post simply type:

	./publish myblog posts mypost

To make changes call `edit` again and change the content of the post.
Afterward, you can send the updates to wordpress by executing:

	./update myblog posts mypost

To edit and publish _pages_, you can use the `pages` type instead of the
`posts` type:

	./edit myblog pages mypage
	./publish myblog pages mypage
	./update myblog pages mypage

The `publish` and `update` commands translate the asciidoc into HTML, and then
they _scrub_ the HTML to make it play well with wordpress's handling of
line-breaks. Also the title is extracted and placed into the REST API call.

You can list your posts or pages by doing:

	./list myblog posts
	./list myblog pages

That's all I have so far. More features are coming soon, as the need for them
arises.

Things Pragmapress can't do, even in theory
-------------------------------------------

The wordpress.com API doesn't allow one to remotely modify a site's themes, and
it doesn't allow one to create a site remotely. The former kind of sucks, while
the latter is understandable (as an anti-squatting measure?).

Things Pragmapress should be able to do in the future, but doesn't yet
----------------------------------------------------------------------

Need to add a command that can 'import' old wordpress posts made with other
clients. This way, we can grab the metadata. Would be nice if there was a
simple html2asciidoc converter. Implement a `stats` command that can do
plotting with R (may seem silly for one site, but for 20 it's neccessary). Also
need to add a media directory, that allows one to beam media up to the
mother-ship.


DEPENDENCIES
------------

You need:

`json` command line utility (https://github.com/zpoley/json-command)

`asciidoc` must be installed (http://www.methods.co.nz/asciidoc/)

`awk` (should be pre-installed on non-stripped-down unixen)

`ksh` (the default shell on SmartOS, should be installable from pkgs)
