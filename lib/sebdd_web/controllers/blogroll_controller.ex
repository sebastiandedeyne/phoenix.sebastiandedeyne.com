defmodule SebddWeb.BlogrollController do
  use SebddWeb, :controller

  @blogroll [
    %{
      name: "Freek Van der Herten",
      description: "Articles on Laravel, PHP, JavaScript & programming in general",
      url: "https://murze.be",
      category: "Laravel & PHP"
    },
    %{
      name: "Laravel News",
      description: "News, about Laravel",
      url: "https://laravel-news.com",
      category: "Laravel & PHP"
    },
    %{
      name: "Adam Wathan",
      description: "Lots of Laravel TDD insights & some entrepreneurial advice",
      url: "https://adamwathan.me",
      category: "Laravel & PHP"
    },
    %{
      name: "Michael Dyrynda",
      description: "Laravel tidbits from down under",
      url: "https://dyrynda.com.au",
      category: "Laravel & PHP"
    },
    %{
      name: "Mohamed Said",
      description: "'Insights from Laravel employee #1'",
      url: "http://themsaid.com",
      category: "Laravel & PHP"
    },
    %{
      name: "Sara Soueidan",
      description: "Frontend guru focussed on SVG & a11y",
      url: "https://www.sarasoueidan.com",
      category: "JavaScript, CSS & Frontend"
    },
    %{
      name: "CSS-Tricks",
      description: "The OG CSS knowledge base",
      url: "https://css-tricks.com",
      category: "JavaScript, CSS & Frontend"
    },
    %{
      name: "CSS Wizardry",
      description: "Valuable insights on CSS architecture & performance",
      url: "https://csswizardry.com",
      category: "JavaScript, CSS & Frontend"
    },
    %{
      name: "David Gilbertson",
      description: "In-depth articles on modern JS in a playful tone",
      url: "https://medium.com/@david.gilbertson",
      category: "JavaScript, CSS & Frontend"
    },
    %{
      name: "André Staltz",
      description: "Cycle.js author, lots of interesting posts on functional reactive programming",
      url: "https://staltz.com/blog.html",
      category: "JavaScript, CSS & Frontend"
    },
    %{
      name: "Wait But Why",
      description: "Longform—like, really long—articles on modern society",
      url: "https://waitbutwhy.com/",
      category: "Non-technical"
    },
    %{
      name: "Sketchplanations",
      description: "I've learned a lot of things I don't necessarily need to know here",
      url: "http://www.sketchplanations.com/",
      category: "Non-technical"
    },
    %{
      name: "Matt Stauffer",
      description: "Practical Laravel goodies",
      url: "https://mattstauffer.co/blog",
      category: "Laravel & PHP"
    },
    %{
      name: "Monica Dinculescu",
      description: "Light-hearted articles on JavaScript, HTML standards & emoji",
      url: "https://meowni.ca/",
      category: "JavaScript, CSS & Frontend"
    },
    %{
      name: "Tighten Co.",
      description: "Laravel, JavaScript, and workplace insights",
      url: "https://tighten.co/blog",
      category: "Laravel & PHP"
    }
  ]

  def index(conn, _params) do
    render(conn, "index.html", blogroll: @blogroll)
  end
end
