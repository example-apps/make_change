Change Machine
================

Project allows you to find change that needs to be give for amount specified.

![tumblr_m118otijL81qapzvgo1_500](https://f.cloud.github.com/assets/506091/417133/a4aa485c-ac5d-11e2-9255-cb44a812aff1.gif)

#### To setup

```
$ git clone <repo>
$ cd <directory>
$ bundle install
```

You can run test with:

```
$ rspec
```

### To get change:

```
Machine.get_change(30)
```

since it defaults to US coins if you want to use another denomination

```
Machine.get_change(<value>, <coins>)
```
coins should be whole numbers. (ex: [2, 3, 7, 14])

[Code Climate](https://codeclimate.com/github/abrahamoshel/make_change)
