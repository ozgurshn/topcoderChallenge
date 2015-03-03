// Playground - noun: a place where people can play

import UIKit
import Foundation

// Challenge 10 – Bloginator (use Xcode6-Beta6)

/**
R1 – Create a constant array of String literals called “types” with the
values: technology, memes, cat videos
**/
// implement code for R1 below

let array = ["technology", "memes", "cat", "videos" ]

/**
R2 – Create a BlogPost class with the following properties:

1. type – String, constant. A random value from the types
array. (Hint: you can use arc4random_uniform to randomly select a value.)
2. views – Optional Int. Set to nil.
3. author – String
4. email – String
5. order – Int. Set to zero.

Create an initializer to set the author’s name (the author property) and email property. Create a “teaser”
method that returns a String with the author’s name and number of views:
“Mike Smith has 5 views for this blog post”. If views are nil,
return “No one has read your blog post yet. Pity.”.
**/
// implement code for R2 below


class BlogPost{
    let type:String? = array[ Int(arc4random_uniform(4))]
    var views:Int?
    var author:String!
    var email:String!
    var order: Int = 0
    init(author: String, email: String ,views: Int?) {
      self.author   = author
      self.email = email
        self.views=views
    }
    func teaser()-> String{
        if let viewCount = views{
               return "\(author) has \(viewCount) views for this blog post"
            }
            else
        {return "No one has read your blog post yet. Pity."}
    }
}
var blog = BlogPost(author : "Mike Smith", email : "asd",views : 5)
blog.teaser()
var blog2 = BlogPost(author : "asd", email : "asd",views : nil)
blog2.teaser()
/**
R3 – Create a “randomAuthor” function that returns a tuple. Then create
an “Author” struct with a “name” and “email” property. Add 5 Author structs
to a dictionary using the author’s name as the key. This function returns
a randomly selected name and email of an Author from the dictionary.
**/
// implement code for R3 below
struct Author {
    let name : String
    let email : String
}
var authorList : [String: String] = ["asd":"asd"]

for a in 0...4
    {
        let author = Author (name: "name\(a)", email: "email\(a)")
        authorList[author.name] = author.email
        
    }

func randomAuthor () -> (name: String, email: String){
    
    let index = Int(arc4random_uniform(5))
    let authorEmail = authorList["name\(index)"]!

    return ("name\(index)",authorEmail)
    
}

let returnAuthor=randomAuthor()
returnAuthor.name
returnAuthor.email

/**
R4 – Create an array of 10 blog posts with a for loop. Set the “author”
property to the value returned from “randomAuthor” function and set
the “order” property to the value of the index of the for loop used to
populate this array.
**/
// implement code for R4 below
var blogPosts : [BlogPost] = []

for index in 0...9
    {
        blogPosts.append(BlogPost(author: randomAuthor().name, email: "", views: 0))
       
        blogPosts[index].order = index
        
    }

blogPosts

/**
R5 – Create a “randomViews” function that accepts the “type” of blog post
for an input. Create an array literal of Ints (these are the possible view
counts) with the values: 10, 20, 30, 40, 50. Select a random value from
this possible view count array and create a switch that returns nil if
the views are 10, 0 if the views are either 20 or 30, else return the randomly
selected number of views. If the “type” passed to the function is
“cat videos” always return nil.
**/
// implement code for R5 below

func randomViews <T>(post:T) -> (Int?)
{
    if (post is String && post as String == "cat videos")
    {
        return nil
    }
    let intArray = [10, 20, 30, 40, 50]
   let randIndex = arc4random_uniform(uint(intArray.count))
    let randvalue = intArray[Int(randIndex)]
    switch(randvalue)
        {
    case 10:
        return nil
    case 20,30:
        return 0
    default:
        return randvalue
    }
}
randomViews("cat videos")
randomViews(blogPosts[1])

/**
R6 – Iterate the array of blog posts, generate a value from “randomViews” function
for each one and set it to the blog post “views” property. Then println the
value of each post.teaser().
**/
// implement code for R6 below
for blog in blogPosts{
    blog.views = randomViews(blog)
   println( blog.teaser())
    
}


/**
R7 – Write a simple stack using a struct with Generics
that has three methods. It should push and pop BlogPosts and also
returns the current count of BlogPosts. Iterate the array of blog posts
and push each one onto the “blogs” stack. Println the count of items in
the stack. Use a for loop to iterate the “blogs” stack, pop the top one
off and println the blog’s teaser. Println the count of items in the stack.
**/

class Stack
{
    var blogPostList : [<T>] = []

    func push<>(post:T)
    {
        blogPostList.append(post)
    }
    func pop()->(BlogPost?)
    {
        var lastBlog = blogPostList.last
        blogPostList.removeLast()
        return lastBlog
    }
    
    func count()->(Int)
    {
        return blogPostList.count
    }
}

let blogs = Stack()
for bl in blogPosts{
    
    blogs.push(bl)
}
println(blogs.count())
println( (blogs.pop())?.teaser() )
println(blogs.count())
