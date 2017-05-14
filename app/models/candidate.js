module.exports = (modelDB) => {
    const Candidate = modelDB.define('tbl_candidate', {
        id: {type: 'serial', key: true},
        fullname: String,
        birthDate: Date,
        email: String,
        phone: String,
        registerId: String,
        registerCpf: String,
        registerIdPath: String,
        registerCpfPath: String,
        adressType: String,
        adress: String,
        complement: String,
        city: String,
        state: String,
        civilServant: Boolean,
        wantScholarship: Boolean,
        recommendationLetterPath: String,
        schoolEducation: String,
        numberOfCourses: String,
        reasonForEntry: String,
        selectedCourse: String,
        status: String,
    });
    return Candidate;
};
