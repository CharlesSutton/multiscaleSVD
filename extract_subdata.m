function [subdata] = extract_subdata(point,data,r)
%extract the point in the data set that are in B(point,r)
% return the subdataset w
[n, D] = size(data);
subdata = [];
for i = 1:n 
    if norm(data(i,:)-point)<r 
        subdata = [subdata; data(i,:)]; %vertical concatenation of the points in the ball(point,r)
    end
end
end