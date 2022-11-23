const fabu = (text) => {
    const timestamp = Date.parse(new Date());
    let flagTime = 0;
    if (timestamp >= TimeContinue.start && timestamp <= TimeContinue.end) {
        flagTime = 1;
    }
    else {
        flagTime = 0;
    }

    if (flagTime === 1) {
        textArrayAdd(text)
    }
}

