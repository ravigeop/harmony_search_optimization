seismic=s_data;
seismic.name='original seismic data';
pc=s_principal_components(seismic); 
s_wplot(pc)
mytitle('First principal component of each trace (correct relative scale and polarity)')
depth=(5000:0.5:10000)';
nsamp=length(depth);
dt=150+25*randn(nsamp,1);
wlog=l_convert([depth,dt],{'depth','ft','Depth';'DTp','us/ft','P-sonic'});
wlog.name='Synthetic log';

