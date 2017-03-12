function y = get_function(N, h, f)

y = 0:N;

if f == 1
    count = 1;
    for i = 0:h:1
        if i < 0.5
            y(count) = 2*i;
        else
            y(count) = 2-2*i;
        end
        count = count + 1;
    end
elseif f == 2
    y = sin(2*pi*(0:h:1));
elseif f == 3
    y = abs(sin(2*pi*(0:h:1)));
elseif f == 4
    %add func
elseif f == 5
    %add
end

end

