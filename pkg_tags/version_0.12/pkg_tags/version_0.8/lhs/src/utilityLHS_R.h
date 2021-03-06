/*
 *
 * utilityLHS_R.h: A C++ header used in the LHS package
 * Copyright (C) 2012  Robert Carnell
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
 *
 */

#pragma once

class utilityLHS 
{
public:
	static int lhsCheck(int N, int K, int * result, int bTranspose);
	static void rank(std::vector<double> & toRank, std::vector<int> & ranks);
	static void rankColumns(std::vector<double> & toRank, std::vector<int> & ranks, int nrow);

	template <class T>
	static void lhsPrint(int N, int K, T* result, int bTranspose);

	template <class T>
	static double sumInvDistance(T * matrix, int nr, int nc);
};

template <class T>
void utilityLHS::lhsPrint(int N, int K, T* result, int bTranspose)
{
	if (bTranspose == 0)
	{
		for (int row = 0; row < K; row++)
		{
			for (int col = 0; col < N; col++)
			{
				PRINT_MACRO("%g ", result[row * N + col]);
			}
			PRINT_MACRO("\n");
		}
	}
	else
	{
		for (int row = 0; row < N; row++)
		{
			for (int col = 0; col < K; col++)
			{
				PRINT_MACRO("%d ", result[row * K + col]);
			}
			PRINT_MACRO("\n");
		}
	}
}

template <class T>
double utilityLHS::sumInvDistance(T * matrix, int nr, int nc) 
{ 
	T oneDistance = (T) 0;
	double totalInvDistance = 0.0;
	/* iterate the row of the first point from 0 to N-2 */
	for (int i = 0; i < nr - 1; i++)
	{
		/* iterate the row the second point from i+1 to N-1 */
		for (int j = (i + 1); j < nr; j++)
		{
			oneDistance = 0;
			/* iterate through the columns, summing the squared differences */
			for (int k = 0; k < nc; k++)
			{
				/* calculate the square of the difference in one dimension between the
				* points */
				oneDistance += (matrix[i * nc + k] - matrix[j * nc + k]) * (matrix[i * nc + k] - matrix[j * nc + k]);
			}
			/* sum the inverse distances */
			totalInvDistance += (1.0 / sqrt((double) oneDistance));
		}
	}
	return(totalInvDistance);
}
