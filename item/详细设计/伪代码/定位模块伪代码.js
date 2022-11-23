//Geolocation获取当前位置
const getNavigatorGeoLocation = () => {
    //判断浏览器是否支持geolocation
    if (navigator.geolocation) {
        //参数
        let options = {
            enableHighAccuracy: true, //是否启用高精确度模式
            maximumAge: 1000, //浏览器重新获取位置信息的时间间隔
            timeout: 15000,//请求超时时间 (15s)
        }

        //分别为成功回调函数，失败回调函数，参数
        //该方法请求一次
        return navigator.geolocation.getCurrentPosition(success, error, options)



    } else {
        //浏览器不支持geolocation
        console.log("当前系统不支持GPS API")

    }

}
//请求成功的回调
function success(position) {
    console.log(position)
    console.log('经度=' + position.coords.longitude)
    console.log('纬度=' + position.coords.latitude)




}

//请求失败的回调
function error(error) {
    switch (error.code) {
        case error.PERMISSION_DENIED:
            console.log('定位失败,用户拒绝请求地理定位')
            break;
        case error.POSITION_UNAVAILABLE:
            console.log('定位失败,暂时获取不到位置信息')
            break;
        case error.TIMEOUT:
            console.log('定位失败,请求获取用户位置超时')
            break;
        case error.UNKNOWN_ERROR:
            console.log('定位失败,定位系统失效')
            break;
    }
}


