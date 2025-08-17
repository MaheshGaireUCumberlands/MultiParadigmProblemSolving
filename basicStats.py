from collections import Counter

class StatisticsCalculator:
    def __init__(self, data):
        self.data = data

    def mean(self):
        return sum(self.data)/len(self.data)

    def median(self):
        sorted_data = sorted(self.data)
        n = len(sorted_data)
        mid = n // 2
        if n % 2 == 0:
            return (sorted_data[mid-1] + sorted_data[mid]) / 2
        else:
            return sorted_data[mid]

    def mode(self):
        counts = Counter(self.data)
        max_count = max(counts.values())
        return [k for k, v in counts.items() if v == max_count]

# Example usage
data = [1,2,2,3,4,5,5,5]
calc = StatisticsCalculator(data)
print("Mean:", calc.mean())
print("Median:", calc.median())
print("Mode:", calc.mode())
