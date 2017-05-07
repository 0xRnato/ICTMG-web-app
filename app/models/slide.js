module.exports = (modelDB) => {
    const Slide = modelDB.define('tbl_slide', {
        id: {type: 'serial', key: true},
        text: String,
        imagePath: String,
    });
    return Slide;
};
