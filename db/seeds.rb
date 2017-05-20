dark_outside = Song.new(name: 'Dark Outside', words: File.read(Rails.root.join('db','seeds','songs','dark_outside.txt')), youtube_url: 'https://www.youtube.com/embed/v8_skQhS6Hk')
one_more_chance = Song.new(name: 'One More Chance', words: File.read(Rails.root.join('db','seeds','songs','one_more_chance.txt')), youtube_url: 'https://www.youtube.com/embed/qFG7RiqD2pg')
in_your_arms = Song.new(name: 'In Your Arms', words: File.read(Rails.root.join('db','seeds','songs','in_your_arms.txt')), youtube_url: 'https://www.youtube.com/embed/lmWcnDBj24k')
stormy_nighs = Song.new(name: 'Stormy Nights', words: File.read(Rails.root.join('db','seeds','songs','stormy_nights.txt')), youtube_url: 'https://www.youtube.com/embed/Gr9QLUx43W4')
somehow = Song.new(name: 'Somehow', words: File.read(Rails.root.join('db','seeds','songs','somehow.txt')), youtube_url: 'https://www.youtube.com/embed/yHkLXNZFJNg')
heres_my_heart = Song.new(name: "Here's My Heart", words: File.read(Rails.root.join('db','seeds','songs','heres_my_heart.txt')), youtube_url: 'https://www.youtube.com/embed/VvdlYPULYXQ')

[dark_outside,one_more_chance,in_your_arms,stormy_nighs,somehow,heres_my_heart].each(&:save)
