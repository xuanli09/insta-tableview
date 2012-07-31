Instagram Tableview

This Project demos an instagram like tableview using AFNetworking to fetch web resources.

![Gallery View](http://instagram.xuanli.us/img/gallery.png)
![Feed view](http://instagram.xuanli.us/img/feed.png)

The project pulls entries from the tag #instadaily through a PHP proxy residing on instagram.xuanli.us/endpoint.php that optionally takes a max_id GET parameter. Requests are forwarded to Instagram and results are returned to the iOS client. 

There is no attempt to parse the caption or tags. Refresh is yet to be implemented either. 