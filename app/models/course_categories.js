module.exports = (db) => {
    const CourseCategorie = db.define('mdl_course_categories', {
        id: {type: 'serial', key: true},
        name: String,
        idnumber: String,
        description: String,
        descriptionformat: Number,
        parent: Number,
        sortorder: Number,
        coursecount: Number,
        visible: Number,
        visibleold: Number,
        timemodified: Number,
        depth: Number,
        path: String,
        theme: String,
    });
    return CourseCategorie;
};
