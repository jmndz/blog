content = "
  <div> <br> Last year, I read four books. </div>

  <div> <br> 
    The reasons for that low number are, I guess, the same as your reasons for reading fewer books than you think you should 
    have read last year: I’ve been finding it harder and harder to concentrate on words, sentences, paragraphs. Let alone chapters. 
    Chapters often have page after page of paragraphs. It just seems such an awful lot of words to concentrate on, on their own, without 
    something else happening. And once you’ve finished one chapter, you have to get through another one. And usually a whole bunch more, 
    before you can say finished, and get to the next. The next book. The next thing. The next possibility. Next next next. 
  </div>

  <br>

  <h1> I am an optimist </h1>

  <div> <br>
    Still, I am an optimist. Most nights last year, I got into bed with a book — paper or e — and started. Reading. Read. Ing. One word after the next. 
    A sentence. Two sentences.
  </div>

  <div> <br> Maybe three. </div>

  <div> <br> 
    And then … I needed just a little something else. Something to tide me over. Something to scratch that little itch at the back of my mind— just a 
    quick look at email on my iPhone; to write, and erase, a response to a funny Tweet from William Gibson; to find, and follow, a link to a good, really 
    good, article in the New Yorker, or, better, the New York Review of Books (which I might even read most of, if it is that good). Email again, just to be sure.
  </div>

  <div> <br> I’d read another sentence. That’s four sentences. </div>

  <blockquote> <br>
    Smokers who are the most optimistic about their ability to resist temptation are the most likely to relapse four months later, and overoptimistic dieters 
    are the least likely to lose weight.
  </blockquote>

  <div> <br> It takes a long time to read a book at four sentences per day. </div>

  <div> <br> And it’s exhausting. I was usually asleep halfway through sentence number five. </div>
"

user_one = User.create(
  first_name: "User",
  last_name: "One",
  email: "user_one@mailinator.com", 
  password: "Asd@123!", 
  password_confirmation: "Asd@123!"
)

user_two = User.create(
  first_name: "User",
  last_name: "Two",
  email: "user_two@mailinator.com", 
  password: "Asd@123!", 
  password_confirmation: "Asd@123!"
)

user_three = User.create(
  first_name: "User",
  last_name: "Three",
  email: "user_three@mailinator.com", 
  password: "Asd@123!", 
  password_confirmation: "Asd@123!"
)

# User One blog posts
BlogPost.create(title: "Why can’t we read anymore?", content: content, user: user_one)
BlogPost.create(title: "A Complete Beginner’s Guide on How to Earn by Writing Articles", content: content, user: user_one)
BlogPost.create(title: "Why Japanese Websites Look So Different", content: content, user: user_one)
BlogPost.create(title: "Is Barbie’s Password ‘uiff;rnl’?", content: content, user: user_one)

# User Two blog posts
BlogPost.create(title: "‘Medicine’: Is sober dancing the new ecstasy?", content: content, user: user_two)
BlogPost.create(title: "How To Wake Up at 5 A.M. Every Day", content: content, user: user_two)
BlogPost.create(title: "Bye Bye, Spotify", content: content, user: user_two)
BlogPost.create(title: "16 little UI design rules that make a big impact", content: content, user: user_two)

# User Three blog posts
BlogPost.create(title: "16 little UI design rules that make a big impact", content: content, user: user_three)
BlogPost.create(title: "Breaking down Logistic Regression to its basics", content: content, user: user_three)
BlogPost.create(title: "Musk Is Holding Tesla To Ransom", content: content, user: user_three)
BlogPost.create(title: "Ant Colony Optimization — Intuition, Code & Visualization", content: content, user: user_three)
