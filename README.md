# LJTools
常用工具类<br />
####1，地图坐标转换，提供以下接口：<br />
//判断是否在中国:<br />
<pre><code>+ (BOOL)isLocationOutOfChina:(CLLocationCoordinate2D)location;
</code></pre>
//将WGS-84转为GCJ-02(火星坐标): <br />
<pre><code>+ (CLLocationCoordinate2D)transformFromWGSToGCJ:(CLLocationCoordinate2D)wgsLoc;
</code></pre>
//将GCJ-02(火星坐标)转为百度坐标:<br />
<pre><code>+ (CLLocationCoordinate2D)transformFromGCJToBaidu:(CLLocationCoordinate2D)gcjLoc;
</code></pre>

//将百度坐标转为GCJ-02(火星坐标):<br />
<pre><code>+ (CLLocationCoordinate2D)transformFromBaiduToGCJ:(CLLocationCoordinate2D)bdLoc;
</code></pre>

//将GCJ-02(火星坐标)转为WGS-84:<br />
<pre><code>+ (CLLocationCoordinate2D)transformFromGCJToWGS:(CLLocationCoordinate2D)gcjLoc;
</code></pre>
