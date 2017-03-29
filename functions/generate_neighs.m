function [data] = generate_neighs(options)
% this function generates a k-pulse and then its neighbours
% it aims to serve local linearity verifications
% NOT circular for the moment 

if ~isfield(options,'width') error('please add field width to options'); end
if ~isfield(options,'epsilon') error('please add field espilon to options'); end
if ~isfield(options,'D') error('please add field D to options'); end
if ~isfield(options,'neigh') error('please add field "neigh" to options'); end
if ~isfield(options,'k') error('please add field k to options'); end
if ~isfield(options,'mu') 
    options.mu = rand(1,options.k); 
else
    assert(length(options.mu)==options.k, 'mu is not of size k');
end % this field may or may not be set manually

data = zeros(1 + options.neigh, options.D);
I = linspace(0,1,options.D);

switch options.type
    case 'gaussian'
        %original pulse
        for i = 1:options.k
            data(1,:) = data(1,:) + normpdf(I, options.mu(i), options.width); 
        end
        
        %neighbour pulses simulation
        for j = 2 : (options.neigh + 1)
            mu_neigh = options.mu + options.epsilon * rand(1,options.k);
            for i = 1:options.k
                data(j,:) = data(j,:) + normpdf(I, mu_neigh(i), options.width); %neighbour pulse
            end
        end
        
    otherwise
        msg = 'this type is not available for the moment';
        error(msg)
end

end