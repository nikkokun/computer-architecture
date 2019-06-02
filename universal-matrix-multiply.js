var matrix = function(m1,m2){
    var len = m1[0].length;
    if(len !== m2.length)return false;
    var m = [];
    for(var i = 0; i < m1.length;i++){//row
        m[i] = [];
        for(var j = 0; j < m2[0].length; j++){//line
            m[i][j] = 0;
            for(var k = 0; k < len; k++){
                var e1 = m1[i][k];
                var e2 = m2[k][j];
                m[i][j] += e1*e2;
            }
        }
    }
    return m;
};
