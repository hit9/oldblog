#!/bin/bash
helpinfo()
{
    echo "mention:your source file's ext must be .mkd";
    echo 'options:';
    echo '  push';
    echo '  clean';
    echo '  cate <cate-name>';
    echo '  post <cate-name> <post-name> ';
    echo '  rm cate <cate-name>';
    echo '  rm post <cate-post>';
}
wiki_dir=./
html_dir=../
case $1 in
    push)
        mkdwiki . -o ../
        git add ../*
        git commit -m ''$2
        git push
        ;;  
    clean)
        if [-d ".mkdwiki.cache~"]
        then
            rm $wiki_dir".mkdwiki.cache~"
            echo 'done.'
        fi
        ;;
    cate)
        path="$wiki_dir""blog/"$2;
        if [ -d $path ]
        then
            echo 'cate '$2' exists.';
            echo 'exit.';
            exit
        fi
        mkdir $path;
        mkdir $path"/posts";
        touch $path"/index.mkd";
        echo '1. ['$2']('$2'/index.html)'>>"$wiki_dir""blog/index.mkd";
        echo '%title '$2>>$path"/index.mkd";
        echo 'done.';
        ;;
    rm)
        case $2 in
            cate)
                if [ -z $3 ]
                then
                    echo "Need cate's name";
                    echo "exit.";
                    exit;
                fi
                rm_dir="$wiki_dir""blog/"$3;
                if [ -d $rm_dir ]
                then
                    echo "remove "$r_dir".";
                    rm $rm_dir -rf;
                    echo "done.";
                    echo "Please rm this line in $wiki_dir""blog/index.mkd :";
                    echo "1. ["$3"]("$3"/index.html)";
                else
                    echo "Not Found This Dir:"$rm_dir.
                fi
                ;;
            post)
                if [ -z $3 ]
                then
                    echo "Need cate's name";
                    echo "exit.";
                    exit;
                fi
                if [ -z $4 ]
                then
                    echo "Need post's name";
                    echo "exit.";
                    exit;
                fi
                filepath="$wiki_dir""blog/"$3"/posts/"$4".mkd";
                if [ -f $filepath ]; then
                    echo "remove "$filepath;
                    rm $filepath;
                    echo "done.";
                    echo "Please move the line in $wiki_dir""blog/"$3"/index.mkd:";
                    echo "1. [..](posts/"$4".html)";
                else
                    echo "File: "$filepath" Not found.";
                    echo "exit.";
                    exit;
                fi
                ;;
            *)
                helpinfo
        esac
        ;;
    post)
        if [ -z $2 ]; then
            echo "No cate's name.";
            echo "exit.";
            exit;
        fi
        if [ -z $3 ]; then
            echo "No post's name.";
            echo "exit.";
            exit
        fi
        cate_dir="$wiki_dir""blog/"$2;
        posts_dir=$cate_dir"/posts/";
        if [ -d $cate_dir ]; then
            if [ -f $posts_dir"index.mkd" ]; then
                num=2;
                while [ -f $posts_dir$num".mkd" ]; do
                    ((num++))
                done
                post_path=$posts_dir$num".mkd";
            else
                post_path=$posts_dir"index.mkd";    
                num="index";
            fi
            if [ -f $post_path ]; then
                echo "File :"$post_path" exists.";
                echo "exit.";
                exit;
            fi
            (echo "1. ["$3"](posts/"$num".html)";cat $cate_dir"/index.mkd") > file.tmp;mv -f file.tmp $cate_dir"/index.mkd";
            touch $post_path;
            echo "%title "$3>$post_path;
            echo "Date:">>$post_path;
            echo "done.";
        else
            echo "The dir of cate "$2" Not found.Please new it";
            echo "exit";
            exit;
        fi
        ;;
    *)
        helpinfo
esac
