-- Fetch all users name from database
select name from user;

-- Fetch all tweets of user by userid most recent tweets first(change the userid as need)(here i have excluded retweets)
select * from tweet where userid="3" and original_tweetid_for_retweet is null order by timestamp desc;

-- Fetch like count of particular tweet by tweetid(change the tweetid as need)
select tweetid,count(tweetid) from likes where tweetid="1";

-- Fetch retweet count of particular tweet by tweetid(change the original_tweetid_for_retweet as need)
select original_tweetid_for_retweet,count(original_tweetid_for_retweet) from tweet where original_tweetid_for_retweet="1";

-- Fetch comment count of particular tweet by tweetid(change the parent_tweetid_for_comment as need)
select parent_tweetid_for_comment,count(parent_tweetid_for_comment) from tweet where parent_tweetid_for_comment="3"; 

-- Fetch all user's name who have retweeted particular tweet by tweetid(change the t.original_tweetid_for_retweet as need)
select u.name from user as u inner join tweet as t on u.userid=t.userid where t.original_tweetid_for_retweet="1";

-- Fetch all commented tweet's content for particular tweet by tweetid(change the parent_tweetid_for_comment as need)
select content from tweet where parent_tweetid_for_comment="3";

-- Fetch user's timeline(All tweets from users whom I am following with tweet content and user name who has tweeted it)(change the f.follower_userid as need)(here i have excluded retweets)
select u.name,t.content from tweet as t inner join follow as f on t.userid=f.following_userid inner join user as u on f.following_userid=u.userid where f.follower_userid="1" and original_tweetid_for_retweet is null;