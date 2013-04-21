To run the change maker:

* bundle install from root directory
* pry
* load 'change_maker.rb'
* include ChangeMaker
* run Machine.change_maker method with an amount e.g Machine.change_maker(50)
* run Machine.change_maker method with an amount and optional denominations e.g Machine.change_maker(11, [1,3,5])
