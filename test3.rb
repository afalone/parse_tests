module Test3
# 3) Массив A состоит из N целых чисел. Тройка чисел (P, Q, R) называется треугольником если 0 ≤ P < Q < R < N и:

# A[P] + A[Q] > A[R],
# A[Q] + A[R] > A[P],
# A[R] + A[P] > A[Q].
# Для примера рассмотрим массив A:

#   A[0] = 10    A[1] = 2    A[2] = 5
#   A[3] = 1     A[4] = 8    A[5] = 20
#   Тройка (0, 2, 4) является треугольником.

#     Необходимо написать функцию:

#     def solution(A);

#       которая для массива целых чисел из N элементов вернет 1 если существует треугольник в массиве и вернет 0 в обратном случае. Для примера массив A:

#           A[0] = 10    A[1] = 2    A[2] = 5
#         A[3] = 1     A[4] = 8    A[5] = 20
#         функция должна вернуть 1 (пример выше). 

#           Для такого массива:

#             A[0] = 10    A[1] = 50    A[2] = 5
#           A[3] = 1
#           функция должна вернуть 0.

#             Предполагаем:

#             N  число в диапазоне [0..1,000,000];
#           каждый элемент массива A целое число в диапазоне [−2,147,483,648..2,147,483,647].
#             Требования по сложности алгоритма:

#             в худшем случае время выполнения должно быть O(N*log(N));
#           в худшем случае памяти должно использоваться O(N) .
#             Элементы массива можно модифицировать.

# test:
  #
  # irb
  # 2.1.1 :001 > require './test3'
  # => true 
  # 2.1.1 :002 > Test3.solution([10,2,5,1,8,20])
  # => 1 
  # 2.1.1 :003 > Test3.solution([10,50,5,1])
  # => 0 
  # 2.1.1 :004 >

  def test1(c, p, q, r)
    c[p].first + c[q].first > c[r].first && c[p].first < c[q].first + c[r].first && c[p].first + c[r].first > c[q].first
  end

  def solution(a)
    a.each_with_index{|i, idx| a[idx] = [i, idx] }
    a.sort!{|a, b| a.first <=> b.first }
    p = 0
    q = 1
    r = 2
    while r < a.size && q < r && p < q
      return 1 if test1(a, p, q, r)
      while p < (r - 2) && (a[p].first + a[r - 1].first) <= a[r].first
        p += 1
        q = p
      end
      if q + 1 >= r
        r += 1
        q = p
      end
      q += 1
    end
    0
  end

  module_function :solution, :test1
end

