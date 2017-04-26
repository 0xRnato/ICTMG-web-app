module.exports = (modelDB) => {
    const News = modelDB.define('tbl_news', {
        id: {type: 'serial', key: true},
        header: String,
        body: String,
        imagePath: String,
    });
    return News;
};
