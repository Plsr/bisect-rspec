# `git bisect run` with rspec

Oh no, the tests in our project are failing. Since we do not have CI,
we don't know for how long.

Luckily, we can use `git bisect run` to help us find out!

## What to do

First, setup the project. Clone this repo, then do the regular rails
and database setup.
Afterwards, check the tests:

`rspec spec/models/user_spec.rb` – they fail.

While we're here, we can already initiat `git bisect`:

```
git bisect start
git bisect bad
```

Go back to a commit when they were working. The one where they were
inctroduced looks promising:

```
* 747dd55 - Add new test case (15 minutes ago) <Christian Poplawski>
```

so: `git chekcout 747dd55`

After verifying tests are working here, we can mark this as good:

```
git bisect good
```

Now let git bisect find out when the test suite started failing:

```
git bisect run rspec spec/models/user_spec.rb
```

That's it.
