% Fungsi global dan lokal
function func2(param)
    fprintf('Angka saya %d!\n', param)
    calldouble(param)
end

function calldouble(param)
    fprintf('Dua kali lipat dari %d adalah %d\n', param, param*2)
end
