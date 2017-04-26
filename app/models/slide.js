module.exports = (modelDB) => {
    const Slide = modelDB.define('tbl_slide', {
        id: {type: 'serial', key: true},
        header: String,
        body: String,
        imagePath: String,
    });
    return Slide;
};
