module.exports = (modelDB) => {
    const Calendar = modelDB.define('tbl_calendar', {
        id: {type: 'serial', key: true},
        name: String,
        description: String,
        startdate: Date,
        enddate: Date,
        location: String,
    });
    return Calendar;
};
