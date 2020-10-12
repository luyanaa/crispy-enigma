function E = NernstPotential(Cin, Cout,z,T)
%NERNSTPOTENTIAL: Computes Nernst potential at specified T in celsius
%
% Input Arguments:
% Cin: internal ionic concteration
% Cout: external ionic concentation
% z: ion valence (with sign)
% T : temperature in degres Celsius
%
% Output:
% E: Nernst potential in mV
%
% Note : Cin are Cout need to be in the same units

k = 1.38 * 10 ^ ( -23 );
q = 1.6 * 10 ^ ( -19 );

E = k * T / q / z * log( Cout / Cin ) * 1000 ;

