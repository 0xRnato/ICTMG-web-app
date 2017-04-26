module.exports = (modelDB) => {
    const Note = modelDB.define('tbl_note', {
        id: {type: 'serial', key: true},
        header: String,
        body: String,
    });
    return Note;
};
