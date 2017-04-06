// define our model
// user table example
module.exports = (db) => {
    return DataRecords = db.define('mdl_data_records', {
        id: { type: 'serial', key: true },//Auto_increment key
        courseÍndice: Number,
        name: String,
        intro: String,
        introformat: Number,
        comments: Number,
        timeavailablefrom: Number,
        timeavailableto: Number,
        timeviewfrom: Number,
        timeviewto: Number,
        requiredentries: Number,
        requiredentriestoview: Number,
        maxentries: Number,
        rssarticles: Number,
        singletemplate: String,
        listtemplate: String,
        listtemplateheader: String,
        listtemplatefooter: String,
        addtemplate: String,
        rsstemplate: String,
        rsstitletemplate: String,
        csstemplate: String,
        jstemplate: String,
        asearchtemplate: String,
        approval: Number,
        manageapproved: Number,
        scale: Number,
        assessed: Number,
        assesstimestart: Number,
        assesstimefinish: Number,
        defaultsort: Number,
        defaultsortdir: Number,
        editany: Number,
        notification: Number,
        timemodified: Number,
        config: String
    });
};