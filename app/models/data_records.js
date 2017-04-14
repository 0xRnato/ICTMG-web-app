module.exports = (db) => {
    const DataRecord = db.define('mdl_event', {
        id: {type: 'serial', key: true},
        name: Number,
        description: String,
        format: Number,
        courseid: Number,
        groupid: Number,
        userid: Number,
        repeatid: Number,
        modulename: String,
        instance: Number,
        eventtype: String,
        timestart: Number,
        timeduration: Number,
        visible: Number,
        uuid: String,
        sequence: Number,
        timemodified: Number,
        subscriptionid: Number,
    });
    return DataRecord;
};
