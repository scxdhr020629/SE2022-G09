function flagRightSign(musemumLocation, TimeContinue, myPassword, passWord) {
    const myLocation = getNavigatorGeoLocation();
    let flagPosition = 0;
    let flagTime = 0;
    let flagPassword = 0;
    const weidu = myLocation.coords.latitude;
    const jingdu = myLocation.coords.longitude;

    let weiduShang = (max(musemumLocation.firstPoint.latitude, musemumLocation.secondPoint.latitude));
    let weiduXia = (min(musemumLocation.thirdPoint.latitude, musemumLocation.fourthPoint.latitude));
    let jingduZuo = (min(musemumLocation.firstPoint.longitude, musemumLocation.thirdPoint.longitude));
    let jingduYou = (max(musemumLocation.secondPoint.longitude, musemumLocation.fourthPoint.longitude));

    if (weidu >= weiduXia && weidu <= weiduShang && jingdu <= jingduYou && jingdu >= jingduZuo) {
        flagPosition = 1;
    }
    else {
        console.log("warning!!!")
        flagPosition = 0;
    }


    //当前时间的判定


    const timestamp = Date.parse(new Date());

    if (timestamp >= TimeContinue.start && timestamp <= TimeContinue.end) {
        flagTime = 1;
    }
    else {
        flagTime = 0;
    }

    if (myPassword === passWord) {
        flagPassword = 1;
    }
    else {
        flagPassword = 0;
    }


    if (flagPassword === 1 && flagPosition === 1 && flagTime === 1) {
        return true;
    }
    else {
        return false;
    }
}