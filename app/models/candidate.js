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
        adressType: ['Resitencial', 'Comercial'],
        adress: String,
        complement: String,
        city: String,
        state: String,
        civilServant: Boolean,
        wantScholarship: Boolean,
        recommendationLetterPath: String,
        schoolEducation: [
            'Ensino Fundamental', 'Ensino Médio',
            'Ensino Superior', 'Especialização',
            'Mestrado', 'Doutorado', 'Pós-Doutorado'],
        numberOfCourses: ['Nenhum', 'Um a dois', 'Acima de dois'],
        reasonForEntry: String,
    });
    return Candidate;
};
