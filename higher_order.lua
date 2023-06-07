function createMultiplier(factor)
    return function(n)
        return n * factor
    end
end

tripler = createMultiplier(3)
doubler = createMultiplier(2)

function extract(tbl, condition)
    for k, v in ipairs(tbl) do
        if(condition(v)) then print(v) end
    end
end


function isEven(n)
    return (n % 2 == 0)
end

function isOdd(n)
    return not(n % 2 == 0)
end

print(tripler(3))
print(doubler(3))

test = {1, 3, 5, 6, 10, 12, 16}

extract(test, isOdd)

-- above this line are chat GPT's examples

-- my turn to test 'real world' application that I thought of

users = {}

users[1] = {"Nate", 20}
users[2] = {"Rick", 13}
users[3] = {"Nick", 21}

function filterUsers(tbl, filter, ...)
    local additionalArguments = {...}
    for _, v in ipairs(tbl) do
        if(filter(v, additionalArguments)) then print(v[1]) end
    end
end

function canDrink(user, ...)
    return user[2] >= 21
end

function nameStartsWith(user, additionals)
    letterToCheck = additionals[1]
    return string.sub(user[1], 1, 1) == letterToCheck
end

print("Dude that can drink")
filterUsers(users, canDrink)

print("Dudes that names start with N")
filterUsers(users, nameStartsWith, "N")

print("Dudes that names start with R")
filterUsers(users, nameStartsWith, "R")

-- conclusion: i found real world uses, by passing functions as arguments you can cut down on code duplication quite a bit.
-- more to come